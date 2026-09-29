class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.193.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.193.0/agent-compose-roster.tar.gz"
    sha256 "133a8029ebcbd71346b2fe6c1fcfba0e4c9a47cca89eb11d46f51b2e12c507c3"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.193.0/agent-compose-bundles.tar.gz"
    sha256 "37848e4be682e5c368c39a47cb63b6e2472bdbbe6d8cd810b705aac064f9fdc2"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.193.0/agent-compose-darwin-arm64"
      sha256 "30d7faedcdd8079627eca6193c8810f24c74e3773025dc369beae98a9ea51c63"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.193.0/agent-compose-linux-amd64"
      sha256 "f1bcb4e38c5425e440ab59218d76e7af88b49c2480f99039fd3f3f7bd4edb88e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.193.0/agent-compose-linux-arm64"
      sha256 "690cd1e206612968a7191307fb137e8cfbf28ba248bc1af0df0a81a3bf5923cb"
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
