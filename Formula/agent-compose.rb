require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.212.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.212.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "9bd547c8800523b5561848655fce546bbdefe5c2b9c380c4cd1c5f21ec4a149f"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.212.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "9dbb8aa32b3eab2d8aca281caa83f5b652055a18baa10ce0f6dbfe74133f5ee2"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.212.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "0b37dea16f1a6dce267b1263a384b52893889656c89ee42c77aa663b8c0f1118"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.212.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "13907102784d286632b369907d983b9e34ebc84205d31f7660e143c03146a90d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.212.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "8a6b3975d3dd2394d79a1e2912c28a2a3700ab357febeed1de837e43d9a13308"
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
