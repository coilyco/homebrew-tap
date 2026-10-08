require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.207.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.207.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "1c0faef93d4952566f2f5a79ec51887cf6748a1505223ba7607ebfe27d268d51"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.207.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "364b84e4204f99ed1c0101f2899b804f326e5df85698c138a36c7718575552cd"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.207.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "68b63a2e6c40311e1e37c432f6465bcc957eda6eda10321060ebf4261b42e0d5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.207.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "eab40835e274b73609c8d88da7db37f4cb8122cd40d71f616cdd32b2454db83e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.207.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "8f2fbbd96e2d007ffa8dd52ca5ca7aee03dd9108fc02a306b769ad95e7bc7e26"
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
