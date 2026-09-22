class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.161.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.161.0/agent-compose-roster.tar.gz"
    sha256 "e1e9a4bb4cee19a405ce2a25abbcceca788f393967f4ad84bf6637edb1fff79a"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.161.0/agent-compose-bundles.tar.gz"
    sha256 "b9fb5a599a5c531093975f5705d08e3972cae58ace99c567feb084f2905217c2"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.161.0/agent-compose-darwin-arm64"
      sha256 "fd11c6486b886875729375f3e6e36cab084391210fd5745dafaf21b6b78e2dd4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.161.0/agent-compose-linux-amd64"
      sha256 "1c102a83d5560ea9f8b0d2ba4ceaeaf7ad92c73b4a2524e8587a6fd4c358e0c3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.161.0/agent-compose-linux-arm64"
      sha256 "3dcff094d9eec56e114493110e2801769cb85225ab7a3b86516cecdfc0cd5b99"
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
