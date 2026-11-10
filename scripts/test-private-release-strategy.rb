# frozen_string_literal: true

# The private release strategy against stand-ins for Homebrew and the GitHub API,
# so it runs without either or a token. docs/homebrew-build.md
require "minitest/autorun"

class OdieError < StandardError; end

def odie(message)
  raise OdieError, message
end

class CurlDownloadStrategyError < StandardError
  def initialize(url, message)
    super("#{url}: #{message}")
  end
end

class CurlDownloadStrategy
  attr_reader :url, :downloads

  def initialize(url, _name, _version, **_meta)
    @url = url
    @downloads = []
  end

  private

  def curl_download(*args, to:, try_partial:, timeout:)
    header_file = args[args.index("--header") + 1].delete_prefix("@")
    @downloads << {
      args: args, to: to, try_partial: try_partial, timeout: timeout,
      header: File.read(header_file), mode: File.stat(header_file).mode & 0o777, path: header_file
    }
  end
end

module GitHub
  module API
    class HTTPNotFoundError < StandardError; end
    class AuthenticationFailedError < StandardError; end

    class << self
      attr_accessor :token, :release, :error, :requests

      def credentials
        token
      end

      def open_rest(url)
        (self.requests ||= []) << url
        raise error if error

        release
      end
    end
  end
end

class String
  def blank?
    strip.empty?
  end
end

class NilClass
  def blank?
    true
  end
end

require_relative "../lib/private_github_release_download_strategy"

class PrivateGitHubReleaseDownloadStrategyTest < Minitest::Test
  URL = "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.225.0/agent-compose-darwin-arm64"

  def setup
    GitHub::API.token = "tok-123"
    GitHub::API.error = nil
    GitHub::API.requests = []
    GitHub::API.release = { "assets" => [{ "name" => "other", "id" => 1 }, { "name" => "agent-compose-darwin-arm64", "id" => 42 }] }
    @strategy = PrivateGitHubReleaseDownloadStrategy.new(URL, "agent-compose", "2.225.0")
  end

  def test_the_asset_is_found_by_name_and_downloaded_through_the_api
    url, basename, = @strategy.send(:resolve_url_basename_time_file_size, URL)
    assert_equal "https://api.github.com/repos/coilyco/treehouse-servers/releases/assets/42", url
    assert_equal "agent-compose-darwin-arm64", basename
    assert_equal ["https://api.github.com/repos/coilyco/treehouse-servers/releases/tags/agent-compose-v2.225.0"],
                 GitHub::API.requests
  end

  def test_the_token_travels_in_a_private_header_file_and_not_in_argv
    @strategy.send(:_curl_download, "https://api.example/asset", "/tmp/out", 60)
    download = @strategy.downloads.fetch(0)
    assert_includes download[:header], "Authorization: Bearer tok-123"
    assert_includes download[:header], "Accept: application/octet-stream"
    assert_equal 0o600, download[:mode]
    refute_includes download[:args].join(" "), "tok-123"
    refute download[:try_partial], "a resumed download would send a request with no header file"
    refute File.exist?(download[:path]), "the header file must not outlive the download"
  end

  def test_no_credentials_is_one_plain_sentence_before_any_request
    GitHub::API.token = nil
    error = assert_raises(OdieError) { @strategy.send(:resolve_url_basename_time_file_size, URL) }
    assert_match(/gh auth login/, error.message)
    assert_empty GitHub::API.requests
  end

  def test_a_hidden_release_names_the_credentials_not_a_bare_404
    GitHub::API.error = GitHub::API::HTTPNotFoundError.new
    error = assert_raises(OdieError) { @strategy.send(:resolve_url_basename_time_file_size, URL) }
    assert_match(/does not show release agent-compose-v2\.225\.0/, error.message)
  end

  def test_a_release_without_the_asset_is_an_error_naming_it
    GitHub::API.release = { "assets" => [] }
    error = assert_raises(CurlDownloadStrategyError) { @strategy.send(:resolve_url_basename_time_file_size, URL) }
    assert_match(/no asset named agent-compose-darwin-arm64/, error.message)
  end

  def test_a_url_that_is_not_a_release_download_is_refused
    assert_raises(CurlDownloadStrategyError) do
      PrivateGitHubReleaseDownloadStrategy.new("https://example.com/x", "n", "1")
    end
  end
end
