class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.168.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.168.0/agent-compose-roster.tar.gz"
    sha256 "d7cc426cc2d8b0b96e761275be10fca7af81d3ce277c78f4cceba007cbf3ad5d"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.168.0/agent-compose-bundles.tar.gz"
    sha256 "5f4ccdf46296f2913b9586ff2ea4640ab19c83d272e865be764e4bfde9f2176a"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.168.0/agent-compose-darwin-arm64"
      sha256 "0dafa5b4cb101c1c928ea9dec103cf95ac0edf336a8f341cbd49a64313cf862d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.168.0/agent-compose-linux-amd64"
      sha256 "7df533e29e4b511501f3fb76ea98bb1bfc66e225bd385d55e6abdc2ad78cb417"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.168.0/agent-compose-linux-arm64"
      sha256 "b2b329ddf4634e8b3639e7fbcde9b6cdf036949c2916048cec03ec902f73dc64"
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
