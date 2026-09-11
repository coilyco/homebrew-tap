class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.113.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.113.0/agent-compose-roster.tar.gz"
    sha256 "7139b58696a5e8ea6c2b9e367fb96461af48079ce4db43d8c89e920e6f87478e"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.113.0/agent-compose-bundles.tar.gz"
    sha256 "e433b66c8a3b3e018d48f4a56488209679dfd57cd37a9c90c243f1082674247b"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.113.0/agent-compose-darwin-arm64"
      sha256 "1334c2f629ebb57f4c2b140dae65c1ad166e503a5f97d80fd8e4bf5b40666a70"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.113.0/agent-compose-linux-amd64"
      sha256 "83b848fd2f19833e241d9e2ba7c5d16bc58310d13429da4483f99d69c7a3e867"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.113.0/agent-compose-linux-arm64"
      sha256 "08520faf1fda55d9621939f2c4d3f0da52706c0a7565348212d10c71fba6fbef"
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
