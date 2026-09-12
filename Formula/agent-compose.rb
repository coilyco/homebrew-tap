class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.137.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.137.0/agent-compose-roster.tar.gz"
    sha256 "7236779cef1ebf1545512787a63382832fa6e587e119a0d7f52dcb6724302bbc"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.137.0/agent-compose-bundles.tar.gz"
    sha256 "a2c601e1c58e2f5861fc01fad68f20645830c00a561699aeedc319b3caa5a7f2"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.137.0/agent-compose-darwin-arm64"
      sha256 "6e3d5e84c90229504e12331721dc5b390460ab24f934db122af206af33960bd8"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.137.0/agent-compose-linux-amd64"
      sha256 "1e00b0be77ef1af95ccd948f009b306ef66a2e0ce121a096de8be86cba45cbde"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.137.0/agent-compose-linux-arm64"
      sha256 "9d193c23dca68fcc489b2dc48b158f22cc3f5a8eed9d454fb9e5fc57adb03242"
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
