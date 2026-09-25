class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.175.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.175.0/agent-compose-roster.tar.gz"
    sha256 "4ee9256a4ea32daeda1105d515c8561294521c0bed938cc8a2ec4c97e02952de"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.175.0/agent-compose-bundles.tar.gz"
    sha256 "58198c428dabceb5c7ff6a782b903235222ab4ad361598f369f3567e9e9acc63"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.175.0/agent-compose-darwin-arm64"
      sha256 "1cbe198951475809c331c1a7fa1fa178bdbf113c50e8c19cb09eea8f98d9b76d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.175.0/agent-compose-linux-amd64"
      sha256 "e427f4bfb5f11bc0499632da23d925933ad2d722b4b92c84ef18112ae7c11bfd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.175.0/agent-compose-linux-arm64"
      sha256 "454c40bf511dc3efa4d57ba3157bd5d9719238dc3cc3eeeaa5778f17d799d83d"
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
