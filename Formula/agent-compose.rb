require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.215.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.215.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "a6047ff0f81f09bd15057e14c07b02f27a819c5352dd0d42330a1b31859c69fb"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.215.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "04b574d1802fe5650ce73d29676a856d19aa71514b70ce804cc7ac7765342cd0"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.215.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "e51e58f9251126540107a9ab15060d95311197311dab49c60cf1a1f66ea925e9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.215.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "8d870e6a9bb68c7f8a7a9b207087ffa24153e1f17fb76555b615d0f93c020b55"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.215.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "5416c5272be93a3bfd40d00ca5fd4f59f8dd7aaa3ab7e6813b64f4266b3f0478"
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
