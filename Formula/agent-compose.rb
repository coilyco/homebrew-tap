class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.122.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.122.0/agent-compose-roster.tar.gz"
    sha256 "5bf7604ac719bf90b757746c584d71f65fa461f80b8e96225f291a139ca2f7ed"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.122.0/agent-compose-bundles.tar.gz"
    sha256 "9515899628fcd2bc5eb1f26f025184ca05061f3d25c16cf72af0ce7cb0b81c9a"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.122.0/agent-compose-darwin-arm64"
      sha256 "a2074541e9fc95ba1bbfbcbdd5089e44b67c0efe05f182346f60ea18541e80af"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.122.0/agent-compose-linux-amd64"
      sha256 "a4c715e8baea72f4f97595a654ae90a792373193223f88a687e65b95300cab8a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.122.0/agent-compose-linux-arm64"
      sha256 "56586019d1b8f8c8354bae73792adf7b532d753c399b3c7903cc4a05f39a5922"
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
