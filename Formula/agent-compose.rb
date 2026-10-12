require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.213.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.213.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "353cd70fec8d5cfff3adf09fde3c6158acdc883ec1b44d6b69e465ec7300ab6a"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.213.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "ce9a5ec493ccf5f13107d2924c01d204cb2dbf448c3cd879e980e36d7dd8fbce"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.213.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "05777706bf7e5d91282d8de66d6eadc41b0ee4be427d29ab57f4c49d37d3b816"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.213.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "a64a1a98c9ca245e5840c89bacd4115e6a56888fc0f72b822e4c5b9abc965ac1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.213.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "702d468dd4cd4a8275d1806aa1259b76521286fcc9dc2456b5f8ac730c11307e"
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
