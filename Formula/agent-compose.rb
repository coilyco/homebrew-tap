class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.108.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.108.0/agent-compose-roster.tar.gz"
    sha256 "e99aa15366927aa75fb456568d16f8c890fd5540d75c71a69e0c7a8919c625d7"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.108.0/agent-compose-bundles.tar.gz"
    sha256 "032229ee294cd3bc5b49dfd7781ff3f3aac526015f599ebb851b4a9c361790c3"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.108.0/agent-compose-darwin-arm64"
      sha256 "6b6485ccfde1cc7c0593bab26d063aaf426d46b7a40209c8ed2e683891179319"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.108.0/agent-compose-linux-amd64"
      sha256 "251fd0cb00c60b9cb2f182bcadcf4cf97b8e3dd5017a6d9aed5d06d147ed8d61"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.108.0/agent-compose-linux-arm64"
      sha256 "4f19df1f21498aefc512f9f8ff21811ff2d87be8399db92b678e260992518e6c"
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
