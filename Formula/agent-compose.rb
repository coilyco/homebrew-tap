require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.198.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.198.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "20475ecb9dc7b2039808aab9769f0be4cc10c0922f3cae1e613c1b0b1e1fabda"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.198.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "4dfa45412c2e616afa88359a472d76efd22d4b3ebcf82786db84f1ca1fffdd9e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.198.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "73ac3ce05bdd8b5e471e163690d851f064c17acefe457e10887facd42c5e1cf6"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.198.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "968651b67f95c5e690af5412ca2519eb6d62f8a9f98d18b810908301fbff56be"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.198.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "4ad63c0773a28ec9236b14aae98016ec93953e8bc9598132f90e1a2fe40062f4"
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
