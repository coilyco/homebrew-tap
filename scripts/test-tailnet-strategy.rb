# frozen_string_literal: true

# Runs the download strategy against stand-ins for the two Homebrew pieces it
# touches, so the probe logic is checked without Homebrew installed.
require "minitest/autorun"
require "pathname"
require "socket"
require "tmpdir"
require "uri"

class OdieError < StandardError; end

class CurlDownloadStrategy
  attr_reader :url, :cached_location

  def initialize(url, cached_location)
    @url = url
    @cached_location = cached_location
  end

  def fetch(*)
    :fetched
  end

  # Homebrew's own order: an uncached download is located by a request to its host,
  # which is the call that hangs on a host that never answers.
  def cached_location
    return @cached_location if @cached_location.exist?

    resolved_url_and_basename
    @cached_location
  end

  private

  def resolved_url_and_basename(*)
    [url, "basename"]
  end
end

def odie(message)
  raise OdieError, message
end

require_relative "../lib/tailnet_download_strategy"

class QuickProbe < TailnetCurlDownloadStrategy
  def probe_seconds
    0.3
  end
end

class TailnetDownloadStrategyTest < Minitest::Test
  def strategy(url, cached: false)
    path = Pathname(Dir.mktmpdir).join("download")
    path.write("cached") if cached
    QuickProbe.new(url, path)
  end

  def test_a_reachable_host_goes_on_to_download
    server = TCPServer.new("127.0.0.1", 0)
    url = "http://127.0.0.1:#{server.addr[1]}/agent-compose"
    assert_equal :fetched, strategy(url).fetch
  ensure
    server&.close
  end

  def test_a_refused_connection_says_it_is_tailnet_only
    server = TCPServer.new("127.0.0.1", 0)
    port = server.addr[1]
    server.close
    error = assert_raises(OdieError) { strategy("http://127.0.0.1:#{port}/x").fetch }
    assert_equal TailnetCurlDownloadStrategy::MESSAGE, error.message
  end

  def test_a_silent_host_times_out_fast_with_the_same_message
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    error = assert_raises(OdieError) { strategy("http://10.255.255.1:443/x").fetch }
    assert_operator Process.clock_gettime(Process::CLOCK_MONOTONIC) - started, :<, 3
    assert_includes error.message, "only available on the coilyco tailnet"
  end

  # Homebrew asks where a download is cached before it fetches, and that request has no
  # short timeout, so a host that never answers hung the install before fetch ran.
  def test_locating_an_uncached_download_on_a_silent_host_fails_fast_too
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    error = assert_raises(OdieError) { strategy("http://10.255.255.1:443/x").cached_location }
    assert_operator Process.clock_gettime(Process::CLOCK_MONOTONIC) - started, :<, 3
    assert_equal TailnetCurlDownloadStrategy::MESSAGE, error.message
  end

  def test_a_cached_download_is_located_without_probing
    assert_kind_of Pathname, strategy("http://127.0.0.1:1/x", cached: true).cached_location
  end

  def test_the_message_names_both_audiences
    assert_includes TailnetCurlDownloadStrategy::MESSAGE, "If you're on the tailnet and have access, connect and retry."
    assert_includes TailnetCurlDownloadStrategy::MESSAGE, "If you're the general public, you don't have access to this."
  end
end
