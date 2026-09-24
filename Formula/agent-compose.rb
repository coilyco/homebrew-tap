class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.171.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.171.0/agent-compose-roster.tar.gz"
    sha256 "96a66b63dc313042399003c7253a86b89821e6095c5f3003c5b123936c450068"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.171.0/agent-compose-bundles.tar.gz"
    sha256 "03047770473cf6051f217476427110d8582d3ac0b968e15a32a5e44854c33152"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.171.0/agent-compose-darwin-arm64"
      sha256 "3c3459e89a41b3944b6673bb4c9f4310e522e943bf0f759e2c940a81de82d909"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.171.0/agent-compose-linux-amd64"
      sha256 "51eaa1768b51b0f1779bb49e5c862ea3511f23321b36e44f80a21b3931a6b7f7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.171.0/agent-compose-linux-arm64"
      sha256 "d9bf33b8b52430d3de387de9e3d86d008d2e4d1f2644ca3ea04eaca8d64524bf"
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
