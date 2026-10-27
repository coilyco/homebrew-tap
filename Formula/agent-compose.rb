require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.216.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.216.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "43c9eacd1cbab13b732bcc7dbc10b848fafa92108fab9a46592c28a03dd5c995"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.216.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "d23e3c29d8a07a783858309ccfbc31c43aad5e18e310e0f5a5da6dc1303bb882"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.216.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "89d8d746cf333596f832cfcdc6423bd4421d9a3cbfb61187a904dc4dbb3271b4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.216.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "64524551d1add349bb7dc8dd03a765d3c52a8d4b8d34b993ef56a77500e30173"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.216.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "1c03d7be48b3bbd26444de8ad7da40976e2fa010481a39bbbeeb71e1787539c2"
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
