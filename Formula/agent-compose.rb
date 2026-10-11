require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.210.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.210.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "4953b2269b70e25b7091e48eea4ffdbaeb6e623b9b27ef2c2eef2c86f551a1ca"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.210.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "3f225e10bfd079a3ebec46591baeec95efd59e4dcc4011934fd9acb1c9c327c2"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.210.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "bf04a66017c26ee942d46299f349446b6956155b1c9b0c6d7bd81631e1f3a469"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.210.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "a1242a623d4fb2b03efcdb417697c159227e152fc24c8e5a8d45a3b16b7a45ba"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.210.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "e6d74b4076f9cbc1fbe1e77339eaffeebd754b98f56a8c308f342f2beeb646df"
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
