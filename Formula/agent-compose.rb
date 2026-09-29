class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.191.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.191.0/agent-compose-roster.tar.gz"
    sha256 "9e6d3e10b3e928ff0e5aca2570a48cf50711aa2cf23f3edb3a50c5bd25dc4abb"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.191.0/agent-compose-bundles.tar.gz"
    sha256 "6f9bcd571a3e3c135bd3a1ae9542689208b871cacd53d5ada9d6659e8ce6fddb"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.191.0/agent-compose-darwin-arm64"
      sha256 "67977dd9131a8243b9e26d584b605d4fb6294af54eb0422fc740f577539a08b3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.191.0/agent-compose-linux-amd64"
      sha256 "f01006a58d8309a7612568a9bfe6450ee6c5389eb1ce4259e0417153c8847053"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.191.0/agent-compose-linux-arm64"
      sha256 "ab4b23cefe75559546636e490f6eb0efc44a548a56d460de284a0a2dea98b016"
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
