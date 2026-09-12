class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.135.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.135.0/agent-compose-roster.tar.gz"
    sha256 "1fd6d73a9d9e1d1bccfb94691a481a26a5ec31c53b6431f3e17530b9cfb135e4"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.135.0/agent-compose-bundles.tar.gz"
    sha256 "8987b6da8c88451770e761583c4122f92d24dfdeab6eed73b690208d143d856e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.135.0/agent-compose-darwin-arm64"
      sha256 "44c9dd462c84c949c522cd165000b33c9f21cb09b1f6fd6c9cafd618eabfd721"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.135.0/agent-compose-linux-amd64"
      sha256 "f01dace0674f1596a1f33c66f9ca034f9be49138d4a8bd27b13aee1a2128e1b1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.135.0/agent-compose-linux-arm64"
      sha256 "a50bea68031b9d8ffbcb759e233702c259307fc25eb8972c6a868d0d7cf60a0e"
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
