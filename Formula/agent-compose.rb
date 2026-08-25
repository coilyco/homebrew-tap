class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.48.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.48.0/agent-compose-darwin-arm64"
      sha256 "9725f1491deedd1c38c475a82f4e638e759d3afb88c6b7642853343966f2231a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.48.0/agent-compose-linux-amd64"
      sha256 "bf815bbdf56316736ee789dc542a5343be47b46a7da8ed659f61045fd613921e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.48.0/agent-compose-linux-arm64"
      sha256 "d311f2c5dc5dd333073ad5d9080af46244930e24017e550948fdff6895386164"
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
