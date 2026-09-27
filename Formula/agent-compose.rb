class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.185.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.185.0/agent-compose-roster.tar.gz"
    sha256 "9b40d6da6d8f95b75ce0098cc3493f39bfabb943232a9fa49738d48bb710d4a6"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.185.0/agent-compose-bundles.tar.gz"
    sha256 "7d08ec9e3a43c5e9858ca51a06863216f4de232207255549fd793ed870d21df2"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.185.0/agent-compose-darwin-arm64"
      sha256 "39f65bb7d06e6ad4488adf380ba069433c0689772413a55a33e35b3652ac2000"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.185.0/agent-compose-linux-amd64"
      sha256 "a9fd396bf05e5381237d9febc001da1e477d5dc390e163bb2547669f4d5665c9"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.185.0/agent-compose-linux-arm64"
      sha256 "17711aa74c44d7d8dc9e8ffe8e26ba42a62e9c29db71cbacce5d3dc6ecd5538f"
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
