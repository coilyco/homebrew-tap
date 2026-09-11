class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.129.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.129.0/agent-compose-roster.tar.gz"
    sha256 "f72a5b3eab10046800b239d12bc2cd21d80abc88b171fb904a56ac9bdab7b4a3"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.129.0/agent-compose-bundles.tar.gz"
    sha256 "1dc9094c57622bacd0bab52f32c04c398c94f300ecd04879114ab712d37d8006"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.129.0/agent-compose-darwin-arm64"
      sha256 "5d68102625b0210d1604a2ac7c40ca67130adf37fc8aa6fcdf4ab4b5ec684e8f"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.129.0/agent-compose-linux-amd64"
      sha256 "7971b4d13c7f2273f33094af9fda47c427b7fc7e7e17b113fbcab4e983bd11a0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.129.0/agent-compose-linux-arm64"
      sha256 "0fe756a4a86d85fb546f659384d93dd5f84b891b494d78172a7a35a8ee624963"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
    # Homebrew chdirs into a lone top-level directory before yielding a stage
    # block, so a block cannot name the directory it sits inside: agentic-os#6835.
    resource("roster").stage(share/"agent-compose"/"roster")
    resource("bundles").stage(share/"agent-compose"/"bundles")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
