class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.179.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.179.0/agent-compose-roster.tar.gz"
    sha256 "82706926101f58e8597da9ae70b2e7c10d00fc1fc147cbeb182a40ee2251426f"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.179.0/agent-compose-bundles.tar.gz"
    sha256 "0020d81775f99b3b15b0c98366d0db64c7b81a24603876888ac890e415f10917"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.179.0/agent-compose-darwin-arm64"
      sha256 "a4f5aa2504dfaae6844ca713ee7a76a7be003bfa4ad6975369e3540a04ede682"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.179.0/agent-compose-linux-amd64"
      sha256 "7f7d41ee0f20f070125becfd8001ffce979c509232ac0850fada6ed38a0c5d7d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.179.0/agent-compose-linux-arm64"
      sha256 "d97c135b8f4611fbefcfe9d4e1b0b3456365b4264e1f3185df3a7c158490dcd0"
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
