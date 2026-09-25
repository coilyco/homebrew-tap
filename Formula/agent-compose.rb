class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.177.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.177.0/agent-compose-roster.tar.gz"
    sha256 "71cddf37d56a463d39eb9a9a472d4c3365dc6268517df7ababfff068aaf82195"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.177.0/agent-compose-bundles.tar.gz"
    sha256 "239d21081cb293fcadffdd178c320d24b79aac3554969ae7acbdd30cb8cc46c8"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.177.0/agent-compose-darwin-arm64"
      sha256 "479f3bb24d925aec3a4533678ba67852016e8ff440a51f8b094515f0a0103d35"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.177.0/agent-compose-linux-amd64"
      sha256 "28e5df6e219a820e24ac972cdfffb9cffc2a7573aaf812532114db545a45597e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.177.0/agent-compose-linux-arm64"
      sha256 "7c21ff15b62162310d44f7d8fcff4c2aedb860bb7a242d0b5f05d3e2e901f122"
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
