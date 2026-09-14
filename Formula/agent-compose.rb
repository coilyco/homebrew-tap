class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.140.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.140.0/agent-compose-roster.tar.gz"
    sha256 "61a3d8c8776d9e3995df3526bd7b0eaa1f6837211a677f1e408de8e57eeae27e"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.140.0/agent-compose-bundles.tar.gz"
    sha256 "daed422b8fc876378d1c795be1e139933f7f26102462c2e5cf75915d91428519"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.140.0/agent-compose-darwin-arm64"
      sha256 "2fb2d0118b6cb913e43d2de01c1dbdfa931e682eeb1f4963197c2fef8728fbeb"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.140.0/agent-compose-linux-amd64"
      sha256 "3c9bb07a0686a2a284aa920c1fe2165ef505f263a6fd4ef3fd95be504025a88f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.140.0/agent-compose-linux-arm64"
      sha256 "17075e01a9715549a8adec98af12271cbdab2327342f3e41b9081ec5ac1a481d"
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
