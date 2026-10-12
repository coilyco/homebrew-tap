require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.214.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.214.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "51c756136382c0aad879700becd4841bead55d0be7998eb6e1cc047719a0c0b0"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.214.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "14605251e2535d6aa6875688921a761cda55d1710dd7a08bcca410b524bbbf1e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.214.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "7293312435130092ca51c665740de5ed6c914b534516b86477b6667bff8a6042"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.214.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "0003495fec2a1501842e478eefc7083ad65a87a2acf78b0bc4c6ebe15d8c176b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.214.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "be63d0fcbbaf0748763b414525de1fa233db4cae7bf58d950e1cc2510e04932f"
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
