class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.176.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.176.0/agent-compose-roster.tar.gz"
    sha256 "68c3ad7829b9f2e84153af485e60ea1096959014b46a09a487cd334af1b5c566"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.176.0/agent-compose-bundles.tar.gz"
    sha256 "b2210d8560b25bf7a95058b98a850f4acc810f4547e47c1886af633349fa8f85"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.176.0/agent-compose-darwin-arm64"
      sha256 "75a16f161c949c86a6595ff2d6c0768ebba8c7719c178910a66d75c4b68525bf"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.176.0/agent-compose-linux-amd64"
      sha256 "e6089a244e166f4161eca2517d8dca4fcc8729cd6c8839b700059ce7990efb51"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.176.0/agent-compose-linux-arm64"
      sha256 "6acdb37a7b5ad06356538f33474e13415b10088581099ca99e0ff1b80932b933"
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
