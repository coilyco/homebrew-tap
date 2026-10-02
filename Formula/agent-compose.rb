class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.196.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.196.0/agent-compose-roster.tar.gz"
    sha256 "2744167dd84a0c943baa11fb89c07e30ff86a8d720344088baa5aaa52e658455"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.196.0/agent-compose-bundles.tar.gz"
    sha256 "cd1b755d4c2d744c7d35809a898ce7503db521c0e7ea08edd77ee61a51bb319f"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.196.0/agent-compose-darwin-arm64"
      sha256 "58697e9d74afc77380ad9b5d3ca0a59def47a8c873afd7b118a31e8dbf3e1b90"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.196.0/agent-compose-linux-amd64"
      sha256 "79217371792c909cb12b4d662b8c9b3ec5907db55eb4891241c2289f0ddbc1af"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.196.0/agent-compose-linux-arm64"
      sha256 "a148760cd975c2c0400e712d892038f9e2b9eb94f85141bde9d52157d413da7e"
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
