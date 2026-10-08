require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.206.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.206.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "a13d1625ab58b69df4e8f34b7c1e348609d94774fa2868e64139e8f699786659"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.206.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "e0210a2051e22988a87991d204ef66efd292b9dfac72d1c3400b389175495ecf"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.206.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "c023f435d809a511d66348979542a1b9768a34dfd2c6a8906469ade140730f04"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.206.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "baa538a8e30866d146bbb6f32d8ffcbd765db8f9cc974d1383d201c7ba760d33"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.206.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "2d658f9b59ec623f0a21cf24c55f633928a77c2273d66316c7151ec1d4bd0f52"
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
