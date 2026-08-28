class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.73.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.73.0/agent-compose-darwin-arm64"
      sha256 "d4efd2c63c6ee9408b7eaef425f96f30594195da7d74d248a29f70dcbb7e83e3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.73.0/agent-compose-linux-amd64"
      sha256 "c8121b70ee0883c69613621482a884192dd493080f39541e4ae12bffc34d617e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.73.0/agent-compose-linux-arm64"
      sha256 "90f6092a7027a1f786f63972eb886c8a8957ee9cab3d10821d9023280e684029"
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
