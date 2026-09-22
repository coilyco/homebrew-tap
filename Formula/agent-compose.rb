class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.162.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.162.0/agent-compose-roster.tar.gz"
    sha256 "14abac9f5bf7c361bcb3258b84387a5bcde786422cb91fd0f7ecda803ff2ae2f"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.162.0/agent-compose-bundles.tar.gz"
    sha256 "06b259698e84380b0cc59b52be2c70f91c8b8f2d8dd3a93fbf6c49c7348c3900"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.162.0/agent-compose-darwin-arm64"
      sha256 "2e9e63552dbe80827be8d7f81e743a44fbc9895fa3c15b317182303eb3b545fd"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.162.0/agent-compose-linux-amd64"
      sha256 "47bce0d3c18ae38f30e80760731ab11e4e117d00723c61c38dc711deae289ee8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.162.0/agent-compose-linux-arm64"
      sha256 "ef017e12198c89cbbfc6d89536815369c63e4f929449113c55ed84da74744f0f"
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
