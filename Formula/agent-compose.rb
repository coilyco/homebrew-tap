class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.102.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.102.0/agent-compose-roster.tar.gz"
    sha256 "e5bec7d220635d23c2db3881282ebbc65041d490e354dce1a8cb7630c0e97f6f"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.102.0/agent-compose-bundles.tar.gz"
    sha256 "5e5f69fca61a041d64d82418a94abda36f0fc3aa93fda8f83aa060e990348403"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.102.0/agent-compose-darwin-arm64"
      sha256 "12fe664bee3749f0f552e2bf939f21d617b0a6b5dead4c8110704728cad1d58c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.102.0/agent-compose-linux-amd64"
      sha256 "f6c17df99dc1ea365bb7ee542f989684c569dede6d75f806bb890b655dd3fc49"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.102.0/agent-compose-linux-arm64"
      sha256 "7aeca4451c97264cf31af48ff6f2a54a3ae7f83b971fca8795ea8bef1370dbf7"
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
