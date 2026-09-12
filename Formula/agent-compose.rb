class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.136.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.136.0/agent-compose-roster.tar.gz"
    sha256 "d4a58793d5beacc0017bb65630bd009c7cb926077520f3d11e06b04840fb58ad"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.136.0/agent-compose-bundles.tar.gz"
    sha256 "0aac5a99657e992fd76670bdc9f9a9b761d518ecfdfd349c31bd149f06f25837"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.136.0/agent-compose-darwin-arm64"
      sha256 "f1e24808010ec25ff7bae0fa42810232cfc31979233d2fb78335bdaa7ab99b2e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.136.0/agent-compose-linux-amd64"
      sha256 "f6cbc39aca49ff84060ea0c18072d03d2723e486c1b16673e3afadce133ac32f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.136.0/agent-compose-linux-arm64"
      sha256 "147d0d7d048cb73641f4f5f150884fd3cb2c8a7b37c4134863847dda9ca9627c"
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
