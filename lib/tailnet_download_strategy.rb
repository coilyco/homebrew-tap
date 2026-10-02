# frozen_string_literal: true

require "socket"

# agent-compose's host answers only on the coilyco tailnet, so probe it first and an
# outsider gets one clear sentence, not a curl timeout. docs/homebrew-build.md
class TailnetCurlDownloadStrategy < CurlDownloadStrategy
  PROBE_SECONDS = 3
  MESSAGE = "agent-compose is only available on the coilyco tailnet. " \
            "If you're on the tailnet and have access, connect and retry. " \
            "If you're the general public, you don't have access to this."

  def fetch(*args, **kwargs)
    require_tailnet!
    super
  end

  private

  # Homebrew asks where a download is cached before it fetches, and for an uncached one
  # that is a HEAD request with no short timeout, so probe here, ahead of every request.
  def resolved_url_and_basename(*args, **kwargs)
    require_tailnet!
    super
  end

  def probe_seconds
    PROBE_SECONDS
  end

  def require_tailnet!
    return if @tailnet_reachable

    uri = URI(url)
    Socket.tcp(uri.host, uri.port, connect_timeout: probe_seconds, &:close)
    @tailnet_reachable = true
  rescue SystemCallError, SocketError, IOError
    odie MESSAGE
  end
end
