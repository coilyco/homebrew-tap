class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.151.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.151.0/agent-compose-roster.tar.gz"
    sha256 "4611d4b50268a80f7bd21989d3c4fb89fe45e5c2bf97f38cab30bacdf55f9b81"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.151.0/agent-compose-bundles.tar.gz"
    sha256 "718cbd09e872d13c455f306a7a581777fa4e9d4667e1d9766ae67900ea9ed8f0"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.151.0/agent-compose-darwin-arm64"
      sha256 "15c608d767f1f28d214d2986a1b2671773464d1fbaecb77836a00e797453541d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.151.0/agent-compose-linux-amd64"
      sha256 "dcee14c8a962ca8825b2ce3dad067985f16f501465e619fe6c7ec99530d70dbc"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.151.0/agent-compose-linux-arm64"
      sha256 "656b535f4583407257b706a8fbe9d406b39e905940b408eab38a4593cbeef963"
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
