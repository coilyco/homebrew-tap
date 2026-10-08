require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.205.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.205.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "085dcd89c368ebeb60c2421c02ccbeba3d98ae4851533a991e4c868b182330cf"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.205.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "58ba558f5b9d4b7d830d6e2b694a4ee8e8026aa7ec66c986ea46dd8d9cc91a64"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.205.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "6a5a65ccf026ad45e88a0f53c895ddbd2fab1ca8d5c301bb7f0d8535f0f344dd"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.205.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "4fbc21f8b1bb3a9c26aadf7c0ea83730823c499ce2814427e187aaa08dc2471a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.205.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "09d4c66d326b76e775143f7868ab21a074bbc5ab44d51b07cbded8e6cba9d42b"
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
