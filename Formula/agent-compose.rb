class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.127.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.127.0/agent-compose-roster.tar.gz"
    sha256 "53bfb94bb7f0935b2fd34e411a2d51c6dda9b8211def66f36fa21454bfff771e"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.127.0/agent-compose-bundles.tar.gz"
    sha256 "b7083e5549dbd82bfcf47107c47993c55cf203584fb4505069ec36cca2b6d15f"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.127.0/agent-compose-darwin-arm64"
      sha256 "4158831eb2c160d2131508bd140e5666a42006ca4ab6cbe2b16919211d72862b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.127.0/agent-compose-linux-amd64"
      sha256 "5e1c10522cabcad43b49a6a3a4a3cdedbe7eb1cf8b67fc415f9c3309f2fea6f2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.127.0/agent-compose-linux-arm64"
      sha256 "f28c5440cd31cbf3569e0da172d1a6b4ac8564d86117cbdffd38f65c8386548f"
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
