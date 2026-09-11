class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.114.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.114.0/agent-compose-roster.tar.gz"
    sha256 "1b47fc319b90fad3d89159ce9d6e773853679958014e8ba97e75fdb67965b98a"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.114.0/agent-compose-bundles.tar.gz"
    sha256 "ca5a26e205f986815eb3abee4353fde409ca6f08bc739a49c3111121ad94586b"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.114.0/agent-compose-darwin-arm64"
      sha256 "1d5afd6041b6419b623f1c6084c3bbc558e759310b90a7942667425f71c32e47"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.114.0/agent-compose-linux-amd64"
      sha256 "8738cdfd3f90b4b9eaf12994bb68f03deb0c140a6c79075db835f58cd1c1e666"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.114.0/agent-compose-linux-arm64"
      sha256 "40a13ddc9e16465b085ef79043b3b1b163163bde854e7d0de254040c906101e5"
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
