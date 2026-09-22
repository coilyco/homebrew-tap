class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.160.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.160.0/agent-compose-roster.tar.gz"
    sha256 "9b94c4609e123787e18f8cadbfcbacf68a9601cb3a121098e8d22462b0f3cf4d"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.160.0/agent-compose-bundles.tar.gz"
    sha256 "248db73678913f701f6c101db80ed3e27e84f837df24f54950bb12cd4357d1ba"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.160.0/agent-compose-darwin-arm64"
      sha256 "0e5106d20fe1a1266aaebcbe5794609d182082415c87253be3524996a18ff092"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.160.0/agent-compose-linux-amd64"
      sha256 "fcbdcec70870e4a8ace37dbb67f4703608fdc4e88f87eb32a845fde3a9a69c0d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.160.0/agent-compose-linux-arm64"
      sha256 "05276cb8b2778ec99d730c68ef8f1ad01cf19e9ae8159db61d1de7b82d884f97"
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
