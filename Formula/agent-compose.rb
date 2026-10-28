require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.217.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.217.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "d7f5c385067a466e5d3c4a9ba9d80d4c5a8e7ca31cb46b0ebfc3bc2f4f122ff9"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.217.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "4c99958156ae03444c3c2f1b22147ac4e610d324b09db10de824a88190214ab5"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.217.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "a920fdb3188420275d6747f1698028efe1c955ec073ad8b5e62ac988fdc3ee4c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.217.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "6039c34fc4b256e3f1ab249ecee0b2d8ba4e430d30890062f0ba38b6698a0fb1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.217.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "803c3e688bd5884323af2468248f000205928db27e1f0812fc37c7b334849702"
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
