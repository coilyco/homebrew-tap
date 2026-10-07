require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.203.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.203.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "bbe3f8986655ae2af666270acb4cb30931edd3ed3ca36041f1fa381a38bcf8d5"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.203.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "0850ad93293ddbd4314f50b1eef4147ba463bca214ec5f13e8cf11e5fce81b8a"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.203.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "b3f35387a2b29817125cbd2b39138d817678a4b52a635add0fdc0708b7a67ca2"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.203.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "a146d5ce608882de0591f125a4d1238915aed773e5f3cc45caeebf31e4439305"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.203.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "0b8a558df5d5060cecc427cea9f855fc4a7ea73b34c200615e48c3781c65fe40"
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
