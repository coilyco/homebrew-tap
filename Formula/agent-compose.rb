class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.145.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.145.0/agent-compose-roster.tar.gz"
    sha256 "81411a3c732ba8139d5fd423b0f02e64c42250c49ebce5449331d5aad1a9d692"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.145.0/agent-compose-bundles.tar.gz"
    sha256 "8af2d9df7969eb2b77f82f30f5643ac33f6e2c5e6cb8c0a26affc35d742dfc71"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.145.0/agent-compose-darwin-arm64"
      sha256 "c23440d4914e98683b00eb4d66ddddcd64d7903427e6ef3654cb912dab6591f4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.145.0/agent-compose-linux-amd64"
      sha256 "82f97486b21d9ff40484a686a990b30cc63317ef3737d334833121a03ef23813"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.145.0/agent-compose-linux-arm64"
      sha256 "3434c4387f88a10aaf2f89c229db651046674a9cff910c782a7a1aed3084ffed"
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
