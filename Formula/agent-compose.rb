require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.201.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.201.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "a0c5384bfb649bbedbdd9786d845368d2720d93e2183c36cf4f543e896de133d"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.201.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "22623b45b1d4e74fa52d65ac38e6621dec24d04d9eac2a435cf532d5a422b742"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.201.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "c62befad299e7df311f28af74db07f987f34f4e19c52579aba319962ec285ac2"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.201.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "dbbb34da02d45782e1a65da18e5231e8ec012077b13d2b757513d5187175257d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.201.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "1ab6ec8675d58c308e3371ad4db083db574062a9563167efa3e13e4fc2146ab8"
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
