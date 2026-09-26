class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.180.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.180.0/agent-compose-roster.tar.gz"
    sha256 "7411c5fb94dbc6a74ecb487077ca29738f8a62887a749c0d95a7ee04bccf1063"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.180.0/agent-compose-bundles.tar.gz"
    sha256 "3e5d4e7dd0c127955f1b1dfccb140da1cfc59add4ccdb26035eff231380263dc"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.180.0/agent-compose-darwin-arm64"
      sha256 "ffeb8a54e7a4427a44353aab7cf09705d0e58b6c7f597fa5ed6ec2c4435be7c4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.180.0/agent-compose-linux-amd64"
      sha256 "aa2acf31b0d10ffd9d33f920655a5067d0598bb5622fad37f8c4729b3f7a13f6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.180.0/agent-compose-linux-arm64"
      sha256 "0e2b334a93688e0d3f2fa7f600562df9e12c6744cad23163f90144b379a6b7d3"
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
