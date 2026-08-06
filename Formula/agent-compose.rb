class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.11.0/agent-compose-darwin-arm64"
      sha256 "9947f01202303a7c6debf5db12288da7dda69f62ec0015aeca3e2dcfd91b49ad"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.11.0/agent-compose-linux-amd64"
      sha256 "9fe0121611e2a35f9e9e8f06c5b27068d308ca61ea57b4c84b9eafddf8f3d685"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.11.0/agent-compose-linux-arm64"
      sha256 "c6c6cc43cf8d643579735f7ae0aedfed0a88bccda1068b5630b2b0146952e2a1"
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
