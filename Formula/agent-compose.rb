require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.200.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.200.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "abaae5759678422f21b5b766045b91c5039a058dc5172eb6459bf74f97d44c0d"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.200.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "0363c6e450bad723d0e515aa7d9efbd046c039c7a8724a6b3b90f01b593e73bc"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.200.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "0d4bf6620b083bb3fda90c5bcf6467016a5235d5d6010df86fa6271398ca79e9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.200.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "8012870eedb03f9cbcf89ce46867a74e86b3eaffb656bb2894e1d3a3c307764f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.200.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "ddcf85a13f1bcd782ebc501a38168a0332d9c717b925e267056a798481942ea4"
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
