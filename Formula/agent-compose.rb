require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.199.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.199.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "56227fa9778f7bf4e8a9d8d2b4d3b9c923c251455d8391f622054092336052de"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.199.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "54dabe3f81d24f25cee55cd6bc7c1ef341147b764853a73d8f23467118c21ef9"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.199.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "de54a7ec55c92ff7c11f4671eec14e7d273d0cc7d48e696fbcb7228bb27ceb35"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.199.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "98fc9ad7ebf9709cf41cb11823cda9aeb45c49d84d2c1f5edea8004f58ab312f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.199.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "4f340f280853e7886523d7d8ef989cd8ca43dea9db41660d3e614417bb54b091"
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
