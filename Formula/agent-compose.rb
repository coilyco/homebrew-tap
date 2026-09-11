class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.118.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.118.0/agent-compose-roster.tar.gz"
    sha256 "12ad2042a2e11ae97a9248d9a6e35ee707b972bc46512cb724dd7a466bd7f2d3"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.118.0/agent-compose-bundles.tar.gz"
    sha256 "cf40cdbc1db57e10bb7b736a36dcbdb52bbb1b5c09f8bd2cdba1720cee526735"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.118.0/agent-compose-darwin-arm64"
      sha256 "0f525744c8be2c9c9035a89001e3118fe631942616ee5d00b6abc2825e3ca217"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.118.0/agent-compose-linux-amd64"
      sha256 "50ae62db48efe906b790838a4bf5de878b7455f486b12ae2742ef506306e12c3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.118.0/agent-compose-linux-arm64"
      sha256 "001fb2bb9fffb5c40670f94dfd79e5987d9a9308c5fe09123048e717307a8647"
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
