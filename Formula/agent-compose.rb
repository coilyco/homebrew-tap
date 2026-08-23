class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.41.0/agent-compose-darwin-arm64"
      sha256 "26cf6cf551f70c427349cef4756c0a093331bc86ca821f85755081138dfeb6a0"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.41.0/agent-compose-linux-amd64"
      sha256 "0fefd74ace1ed0a663c373453c501d97eee55317e80c1483381aa0137ddf440a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.41.0/agent-compose-linux-arm64"
      sha256 "d5e3e48feed0583b2e6962237d42fa86ef88aa72a1dd2fcb89882519fd2c819d"
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
