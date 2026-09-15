class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.147.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.147.0/agent-compose-roster.tar.gz"
    sha256 "7e878d688328dbcec07fcdee47d2bd1bb8056148877342c88cf15c48e1477790"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.147.0/agent-compose-bundles.tar.gz"
    sha256 "f3b8a423b50b9acfc871e3278e94cffa29bf12ebc89309f5f0b51076aa110abf"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.147.0/agent-compose-darwin-arm64"
      sha256 "fe875e65edbc7654d156766ebb751f8d1e65fc22ad2d95738089879a8b175330"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.147.0/agent-compose-linux-amd64"
      sha256 "66f8aaba225fd15247e4080a3aa234ef9dfec7a556cb86764d6b859630c55ace"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.147.0/agent-compose-linux-arm64"
      sha256 "b6bae7014b26fb34e14233bf509b5fec10692e18ecc48fad84073754e04e6311"
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
