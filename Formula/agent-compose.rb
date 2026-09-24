class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.167.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.167.0/agent-compose-roster.tar.gz"
    sha256 "87a56af81349bdf7cbe37ded6ab423bce37cfbd7fc79265dac5a8e198a58cd79"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.167.0/agent-compose-bundles.tar.gz"
    sha256 "be7ab8f1ec590ed265146c47284aaf6aed3e7a3977457817c4bcb07431efdf02"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.167.0/agent-compose-darwin-arm64"
      sha256 "08d9c73546ba2a10888fe937fd36cbd0fcabcaa5b335e68dc86b6efaa2bcbcd1"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.167.0/agent-compose-linux-amd64"
      sha256 "81be421e02b278cf99f4ef5bed860419c8b2a7dfee3868198deb3377456fcc46"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.167.0/agent-compose-linux-arm64"
      sha256 "7bf078f216d4a7e2f1e1ccd3f2b48e10da7f6826f27c9b606436067c5219665f"
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
