class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.183.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.183.0/agent-compose-roster.tar.gz"
    sha256 "4523511697be0c7ada67fcf43c13c7c20bbcee58cb3017317233d6857ce72716"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.183.0/agent-compose-bundles.tar.gz"
    sha256 "e751aba02ddbaf135c5a92ebaa6837510b3c5275ba564c3dbcc287fcc98090cd"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.183.0/agent-compose-darwin-arm64"
      sha256 "8cc2c8d0d1a4ee94f661bc92194fa9cea60f7ee79cc7de41d030a570035e4c4d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.183.0/agent-compose-linux-amd64"
      sha256 "6581aa7a56a181a0304330917b43016216ee0670a986cb6ea498179f7f12b63a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.183.0/agent-compose-linux-arm64"
      sha256 "6a168fbb7f551242eefc2e0b88e6996007dc10f064164a503029896d33e73791"
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
