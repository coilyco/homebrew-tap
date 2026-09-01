class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.87.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.87.0/agent-compose-darwin-arm64"
      sha256 "a14f9464fabf22e03b9a452f7db08d17e9cc285b1b3ca788a99326b95321e366"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.87.0/agent-compose-linux-amd64"
      sha256 "7f924364d050816a33f325a98d3f573290d866f0172a9a4595018b97cf3d1746"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.87.0/agent-compose-linux-arm64"
      sha256 "a607cc2732495520911c8046e88981e25bc497676a0669ef476d0822d7a017d3"
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
