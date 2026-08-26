class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.60.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.60.0/agent-compose-darwin-arm64"
      sha256 "1f686b7940655112cf77b1c21bbac7594e372a4d2a412932a99f9e076a2e6dd6"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.60.0/agent-compose-linux-amd64"
      sha256 "0c48451d5265078fa8220c80cbfb9b847a18f0b4da2668d2eb7e6619404b989b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.60.0/agent-compose-linux-arm64"
      sha256 "df5387b43a7ff2a2e35ffe1170eb523029cf2396cad0afbeb5dc44b4c5418e38"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
