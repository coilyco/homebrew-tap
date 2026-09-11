class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.123.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.123.0/agent-compose-roster.tar.gz"
    sha256 "4d197c35387c3d9a2a4c3a29c1a4d315ffd900096774633e6ef32814f512e6a9"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.123.0/agent-compose-bundles.tar.gz"
    sha256 "71039e686d0c080773dbbd39166b4f123028dd7f09aaf7702e51a1ead5b0dcaa"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.123.0/agent-compose-darwin-arm64"
      sha256 "377268b7215565ca5a42a240fc982dce79209a7f4b49a25f2d0b7e6a2b714998"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.123.0/agent-compose-linux-amd64"
      sha256 "57e9d3dcb434c15ece36196a6d52a651ca3af114973ce5e563bfded14a129757"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.123.0/agent-compose-linux-arm64"
      sha256 "572d6bf6aade6d502627a8fd6caa624e1fc3ee15aced8eb1fafb8f4d06bd2081"
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
