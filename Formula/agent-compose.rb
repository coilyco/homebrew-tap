class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.141.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.141.0/agent-compose-roster.tar.gz"
    sha256 "456711a2f2fc679b025c65cdb770c3af3b0fa9dcb3a5d28868fb62b1a0a24b61"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.141.0/agent-compose-bundles.tar.gz"
    sha256 "1f7928e4cdbb0297ed71e80dfd3f15f921913b49ed0cd5d33f8f30c17e48e2d7"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.141.0/agent-compose-darwin-arm64"
      sha256 "8054c71e0baae1484ca457aad98dbbe5dba517d0f401974e87a43336945eb1cc"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.141.0/agent-compose-linux-amd64"
      sha256 "82c73827b937ecd1d52b73285620abe8f87bc6ab45ab1c7a452009b5f18a74fe"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.141.0/agent-compose-linux-arm64"
      sha256 "b0033bacc57b7ada6c431140adf4a1263f113832f4584893ec6af975fac453cc"
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
