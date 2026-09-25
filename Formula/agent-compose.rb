class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.174.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.174.0/agent-compose-roster.tar.gz"
    sha256 "591aeef55924e1fec25e1c6ef817c284f57aa4b361ede0c54bc64dc22abad867"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.174.0/agent-compose-bundles.tar.gz"
    sha256 "5767b6486ac9295674047ea663f518efccb75430505326942fae834cf7c31732"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.174.0/agent-compose-darwin-arm64"
      sha256 "dbbf80f10769ff4dc39092fe465f3f97f5184a4c46d86a042f4d64f9e3c30cc9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.174.0/agent-compose-linux-amd64"
      sha256 "fa85c2e66fd87633ad2415c5526c8f3a7876225cb4313aa0af3df7ddfde5d345"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.174.0/agent-compose-linux-arm64"
      sha256 "3de22741ef1db609521f33082d3c68e5f25fa1cc17d123803a55e368b45738ed"
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
