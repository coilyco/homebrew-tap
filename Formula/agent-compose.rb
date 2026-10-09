require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.208.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.208.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "dd606abd3d2c2f5be516eca43ada39eb6e14415d62787d7fe0a7c3ef2ce12072"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.208.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "53b8cbc96295ef5d2b6c7e56e0445128c1936db43f06e7376b62e49c5c4c5964"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.208.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "0472b5dad29d3780b73ae9317e0254083324d3058de1b8157b8d21daca930300"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.208.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "8e149272154fd9306d8d79764625a4383182ba25a94bb5147951d814cd7c16c9"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.208.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "e445f7ee31d4a3292fae2d39c9519f79d33211e1e123ef7aea119cfd78e7562c"
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
