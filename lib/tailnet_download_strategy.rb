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
    require_tailnet! unless cached_location.exist?
    super
  end

  private

  def probe_seconds
    PROBE_SECONDS
  end

  def require_tailnet!
    uri = URI(url)
    Socket.tcp(uri.host, uri.port, connect_timeout: probe_seconds, &:close)
  rescue SystemCallError, SocketError, IOError
    odie MESSAGE
  end
end
