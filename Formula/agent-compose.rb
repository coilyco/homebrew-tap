require_relative "../lib/tailnet_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.197.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.197.0/agent-compose-roster.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "7f9711634ae26dc58945cac9a9a015b88758ad35c53c68b4708ecc8de4e29b61"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.197.0/agent-compose-bundles.tar.gz", using: TailnetCurlDownloadStrategy
    sha256 "df677a9df690b9648cb56bd1fef18dfd89385efc42796af92924d3f13271b88a"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.197.0/agent-compose-darwin-arm64", using: TailnetCurlDownloadStrategy
      sha256 "32afc3c475a8de7980618ed16703f025d305e762ecbc0e026aba30d8fb9c61b4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.197.0/agent-compose-linux-amd64", using: TailnetCurlDownloadStrategy
      sha256 "2d2565d721f0748e83c6e51f4ba81a2a9fc6cf196dab4536dca8fbae7df32f0d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.197.0/agent-compose-linux-arm64", using: TailnetCurlDownloadStrategy
      sha256 "3223da72a46001f34c8ce75e824996c23b73c2fcd42dbac8d93c40e966588f7f"
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
