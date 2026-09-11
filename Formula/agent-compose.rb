class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.125.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.125.0/agent-compose-roster.tar.gz"
    sha256 "816e43264e6bb4af7cd7b9c756fdfb264dc123708f28be02f84f44eefe16ea0b"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.125.0/agent-compose-bundles.tar.gz"
    sha256 "8737b6a31f63ce0d60cf2c96e4a57c42d59662192a5d420dab4b3e8fc1e93db8"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.125.0/agent-compose-darwin-arm64"
      sha256 "c58d6b5b3d289a53034df6a40515e10147f25f421b1f3c4bc937fcc19dec39e8"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.125.0/agent-compose-linux-amd64"
      sha256 "b8bfde9ec417dfad34403079673a869bb0d67e9e21fea3117ae52c440ab61c7e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.125.0/agent-compose-linux-arm64"
      sha256 "49a612989a45b6f78a3d63835058e343132e71a76f0eac293ed3d87b57c0cb18"
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
