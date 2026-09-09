class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.109.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.109.0/agent-compose-roster.tar.gz"
    sha256 "b7371463379c67a7339a487641ad02fb5270c1d14b43d6cae3bc7efe7445d03b"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.109.0/agent-compose-bundles.tar.gz"
    sha256 "2831e64f893f3d5443e8f593f445d986345dbfa567aa210f7e6e2efb8bf59062"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.109.0/agent-compose-darwin-arm64"
      sha256 "75d825cc5adf354238bbf6ccb1ae51e2fcb012a5a85cb896dcf1e5e0aa104715"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.109.0/agent-compose-linux-amd64"
      sha256 "dab3d043c0f6afd9734d96ebb60b87fdab07262dc231c3bf6f8ae07d49a976ce"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.109.0/agent-compose-linux-arm64"
      sha256 "0e008c9a027e830667ee934316e21d4ec2c0beb3978e034ba483c83b1fbe9192"
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
