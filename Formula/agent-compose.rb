class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.195.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.195.0/agent-compose-roster.tar.gz"
    sha256 "c097f453817434f26652bbd7bb68b72585f8d5d00afd7da761d9def53bde5bee"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.195.0/agent-compose-bundles.tar.gz"
    sha256 "7c720bd6593cb6e3275eeb859816ba837bebcd5936381900b026363da15de660"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.195.0/agent-compose-darwin-arm64"
      sha256 "4f453c39d4dd7bd796033b52927c580f0c90169c8424520965261edbd997759d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.195.0/agent-compose-linux-amd64"
      sha256 "74dbfb58558d0ab9ae7a4af3d408b913941a1c2df839bfe44a8c5ec7bc718880"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.195.0/agent-compose-linux-arm64"
      sha256 "c11df788b746ebda9f4e91881eca195746959ce1cb38bb3c4eca90989073384a"
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
