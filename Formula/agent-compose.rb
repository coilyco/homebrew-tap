require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.202.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.202.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "4650d59ceec32dfeea9ca7136691013b3f055b1ead970d75733d33fdaad7c65c"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.202.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "54c45d60cbc12380f132152a59a2d3a8532e9b25fd3d6d7015ae7a34b3083bda"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.202.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "a38bd69421d857acdf6876c70718a7d000a9bd7f7f2b32bc15cb955d27abbe12"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.202.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "f614001593ce32e7dc275d233b6f89674ab7abf442e1c437a9d8a870b00d678c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.202.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "2be978bf94efc17e2f910ace1dbcfe3ae6331aa9cef40c86589ef4b56b97506c"
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
