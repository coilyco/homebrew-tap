class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.90.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.90.0/agent-compose-roster.tar.gz"
    sha256 "308159f8272477c076d7667ab8378fe08d62434bb4983ffedcf8faba97823a85"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.90.0/agent-compose-darwin-arm64"
      sha256 "3d897b62b5d010353d150b887593c4cb7c43d75d109f4f63ca9f965a581f7c3e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.90.0/agent-compose-linux-amd64"
      sha256 "be0e68ae9948a832cb9099091247fead7933462cfaeefcc79228868f188d697d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.90.0/agent-compose-linux-arm64"
      sha256 "c6a28bc248bf88dc6b605126df42124e4462a90136a3c7076cd8178c5278d96e"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
    resource("roster").stage do
      (share/"agent-compose").install "roster"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
