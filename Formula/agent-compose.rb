require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.211.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.211.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "426c2710ee93b6af1e8a22ccda022d921ddcc3a5547d7e8fd12df59b5bcd5cbb"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.211.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "b927a47def432a0d7720f03e32f83ef091db83df785168ce6e4c2deb2dae4cdb"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.211.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "38b5f3d4bffbb1f185006f46b8667c4fc1f06f60336433194205b80d6f46d4de"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.211.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "fdc945f8a21bd526a7e550d1a616b1f34d09bc9c54ea17041f262b0c12ef7938"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.211.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "388168bcb757749028a76db9b4bda3816ce1dfc949a47bdca6d1f62a08a0a833"
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
