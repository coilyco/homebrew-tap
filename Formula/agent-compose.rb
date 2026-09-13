class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.139.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.139.0/agent-compose-roster.tar.gz"
    sha256 "7a789ea00bcd59612790ce7995e17173513a3fe70ae9b5260a95b6d8c0af802e"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.139.0/agent-compose-bundles.tar.gz"
    sha256 "f53a020b0779c003ed4ac2356ade167046fd6519d00d1e3532da1e6f92493207"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.139.0/agent-compose-darwin-arm64"
      sha256 "11adbd462e968d01bfef85364f7ccd0d74baee27c46c8f2e2597c24929cf5ac0"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.139.0/agent-compose-linux-amd64"
      sha256 "7d26e4b5d0e8169020c4627a24db4f4c7dde438625725831c061ffb42c1cc7d1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.139.0/agent-compose-linux-arm64"
      sha256 "28d517574e4d3f91d7015b27e4bb3f9ee47ce32a4a983d9f046e7a0ac1c763a7"
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
