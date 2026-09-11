class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.128.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.128.0/agent-compose-roster.tar.gz"
    sha256 "a7ecb806eaff8d1573ad0f3d50362a5d8ae8969e6783f08cca21dca9ab0a5e46"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.128.0/agent-compose-bundles.tar.gz"
    sha256 "036b6b08df9be0cabf572e72aef0e1256533deb72c8269c8fdd40aee326b0818"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.128.0/agent-compose-darwin-arm64"
      sha256 "08e7df0a0866f528c407c1404adc6fad781a2f34a862fd69051833aacd412213"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.128.0/agent-compose-linux-amd64"
      sha256 "1ed1b499e083e9e321ab65d98300de88a19aad5c5d92c39ab6f768ca78d417dc"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.128.0/agent-compose-linux-arm64"
      sha256 "81885b158457ea41b494c57464e7978ec3d0b91db511d698e7f334fb48b907b7"
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
