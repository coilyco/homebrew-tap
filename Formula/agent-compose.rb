require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.209.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.209.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "7575440fe4b14ddd9d99ae9ee5596ca4e4dac7ed05d51889e69a46d5367e6ec3"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.209.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "a2100d17811c53bb6dfed6fae734b1db1ed29f989b48dd2023e6ed68ec580bc0"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.209.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "c733813d1f20b03ee4d1afac471eb82fb5b9e72a0adfc613456ac049e88161b6"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.209.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "583cf5b106b75deeee6594bcf02675812666fff03081ab54e43f262be3cd7d99"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.209.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "cff5cd4fe9838af7546461717b223787ba569c72f3ac981e1174781c8e2692d2"
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
