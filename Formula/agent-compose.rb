class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.192.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.192.0/agent-compose-roster.tar.gz"
    sha256 "c7081c1f18e10047a2bac93871afa51c2f23c69824a8d0dbd91f87be6a761c72"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.192.0/agent-compose-bundles.tar.gz"
    sha256 "520093def67daf09844096d7d2e24d48bb9854713ecbbb610bfb1b24b4a6a1e8"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.192.0/agent-compose-darwin-arm64"
      sha256 "7ec44aa5eced37edfd40885048d9fc0006296393b0e4cfe0c64c8d24b3f79490"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.192.0/agent-compose-linux-amd64"
      sha256 "8f011bf135984c430041bb064adef4e3d17bc4816317c5aedb5fa70e57c14e56"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.192.0/agent-compose-linux-arm64"
      sha256 "33fa86f1b5301ccb581a8dfe3405222b36536d872c775801aad92347b0829894"
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
