class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.52.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.52.0/agent-compose-darwin-arm64"
      sha256 "a1813adbec491d088494c9319d9307b058f3a3a0e5b6eb3fe8a4e8b060819717"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.52.0/agent-compose-linux-amd64"
      sha256 "c75b5fa73c75c841e1b8b0b42c44f50171cb022157e1fc6280999a0f898decbd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.52.0/agent-compose-linux-arm64"
      sha256 "018cc9b0da86024de2e987ecb23e2d560aa1ccaeb05370f1320af2fd53496676"
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
