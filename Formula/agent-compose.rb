class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.47.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.47.0/agent-compose-darwin-arm64"
      sha256 "3e1fe038345efe0b220a147803498b69e8413e52e2d4e7f29b667b36601743e0"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.47.0/agent-compose-linux-amd64"
      sha256 "2ab5df97d2579d69c23c35dadbc03996d50c96ec23a59109f355fda8d45e84df"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.47.0/agent-compose-linux-arm64"
      sha256 "d8d96af89395d3dbe01caf8a13fa9291aae77761cb966c348e9dfb133c4b6935"
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
