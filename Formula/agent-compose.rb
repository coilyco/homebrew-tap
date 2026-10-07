require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.204.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.204.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "dd03509c54d86cbc8f54c7dc14edab78ca2c4e2b94a7f8bb8de1b4965a94250d"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.204.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "dfb89876fd6f16619b81a6eb597ab5c11649bf308748c3cabd72b7f9ccedee7e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.204.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "87387fb4c925aff702023146779387dd88b9c1dfa515454df25e36ace1712454"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.204.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "970d929e85e3f410f195dfac385a6167349113821d15b2153b9e403f9422e5b8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.204.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "365ef233f26298d4f86337b78ff6b43c520384255e73776455f1834e168a637a"
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
