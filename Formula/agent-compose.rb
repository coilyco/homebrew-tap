class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.100.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.100.0/agent-compose-roster.tar.gz"
    sha256 "f8f3a9fa3e8a0d3d07f65ff92c2d395562910bb6e373def62fdcb2b2b2a55878"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.100.0/agent-compose-bundles.tar.gz"
    sha256 "42f616e71a5c346a514928b8f40823506690550efba44f2f4282f759e530f04e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.100.0/agent-compose-darwin-arm64"
      sha256 "1bf2ec786ef4f733ae9a61f67ed7c66877b8248eb98b17d281d6df8ae54aa019"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.100.0/agent-compose-linux-amd64"
      sha256 "cf12a70ddd1e385222dafe4d9cd45a8d6341095c1674cb497c4c36476fb20f60"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.100.0/agent-compose-linux-arm64"
      sha256 "0cf665f472a6b0306ca95019cf89d6d80f0a39178f2f3c7afc690218c4bd7d01"
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
