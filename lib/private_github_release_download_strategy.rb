# frozen_string_literal: true

require "json"
require "tempfile"

# One asset of a private GitHub release, found through the API with Homebrew's own
# credentials. docs/homebrew-build.md
class PrivateGitHubReleaseDownloadStrategy < CurlDownloadStrategy
  URL_PATTERN = %r{\Ahttps://github\.com/([^/]+)/([^/]+)/releases/download/([^/]+)/([^/?#]+)\z}
  MESSAGE = "This is a private release and Homebrew has no GitHub credentials. " \
            "Run `gh auth login`, or set HOMEBREW_GITHUB_API_TOKEN to a token that can read the repository."

  def initialize(url, name, version, **meta)
    super
    match = URL_PATTERN.match(url) or
      raise CurlDownloadStrategyError.new(url, "not a github.com release download url")
    @owner, @repo, @tag, @asset_name = match.captures
  end

  private

  # Homebrew's HEAD request to the browser url would 404, so answer from the listing.
  def resolve_url_basename_time_file_size(_url, timeout: nil)
    [asset_api_url, @asset_name, nil, nil, nil, false]
  end

  def _curl_download(resolved_url, to, timeout)
    Tempfile.create("private-release-headers") do |file|
      file.chmod(0o600)
      file.write("Accept: application/octet-stream\nAuthorization: Bearer #{credentials}\n")
      file.flush
      # No resume: that path sends a HEAD request without the header file.
      curl_download resolved_url, "--header", "@#{file.path}", to: to, try_partial: false, timeout: timeout
    end
  end

  def asset_api_url
    @asset_api_url ||= begin
      credentials # no login is one plain sentence, before any request
      release = GitHub::API.open_rest(
        "https://api.github.com/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}",
      )
      asset = release.fetch("assets", []).find { |a| a["name"] == @asset_name } or
        raise CurlDownloadStrategyError.new(url, "release #{@tag} has no asset named #{@asset_name}")
      "https://api.github.com/repos/#{@owner}/#{@repo}/releases/assets/#{asset.fetch("id")}"
    rescue GitHub::API::HTTPNotFoundError, GitHub::API::AuthenticationFailedError
      odie "GitHub does not show release #{@tag} of #{@owner}/#{@repo} to these credentials. " \
           "Check that the login or HOMEBREW_GITHUB_API_TOKEN can read the repository."
    end
  end

  def credentials
    token = GitHub::API.credentials
    odie MESSAGE if token.blank?
    token
  end
end
