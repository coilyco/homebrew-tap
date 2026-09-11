class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.116.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.116.0/agent-compose-roster.tar.gz"
    sha256 "ecec3d1687754699b243449fadd663317bdff353057442a0a1b878ab1373533f"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.116.0/agent-compose-bundles.tar.gz"
    sha256 "e522ab5ea47148922e292e7e034014beabf971e7664bee6c019b9d6a3b79de67"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.116.0/agent-compose-darwin-arm64"
      sha256 "706ee36cd9ae81c99516e910d03fa9ca6a1c35cf02d5d2e52cdae33df9eee524"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.116.0/agent-compose-linux-amd64"
      sha256 "de751e8601e6d6f7b33dd04aa916d925bbe3ab59baae6a6245d05d1a547339d6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.116.0/agent-compose-linux-arm64"
      sha256 "0d041a4b37676619f3580a5aab43143b8496071c08b591c958daa09168d8be69"
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
