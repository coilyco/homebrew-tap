class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.194.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.194.0/agent-compose-roster.tar.gz"
    sha256 "f7f5e87c77706950ed858cb96f5422c002399864c7a2671df726e5042a55d010"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.194.0/agent-compose-bundles.tar.gz"
    sha256 "99edaa61796280c4ea441281663f702da243446f2ef4f5381f230bc22fa54ee3"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.194.0/agent-compose-darwin-arm64"
      sha256 "8146e21ba72d5672569477ed1b3536a838b4a9eec7cb57941c5f050b61c06efb"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.194.0/agent-compose-linux-amd64"
      sha256 "8029941b165361fa81a3ae01e20809f451275ac6552eab1bff1b97314139c8c8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.194.0/agent-compose-linux-arm64"
      sha256 "ebc2f9c9a6c50f4ac15e62a2ef1dafd45d1b0be1ca443d8b1939cb6ca0e36b4b"
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
