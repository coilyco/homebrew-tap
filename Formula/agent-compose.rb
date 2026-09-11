class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.130.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.130.0/agent-compose-roster.tar.gz"
    sha256 "c2b1ce5f433d15532b8159e823fa2ca53126db5e7939f4293b2726b5342f0414"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.130.0/agent-compose-bundles.tar.gz"
    sha256 "0e0a46e672ec838638e45ed7b0a70c944becf52dba443598a8d733baf763803c"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.130.0/agent-compose-darwin-arm64"
      sha256 "43ce306a76dd7d47354dfbead47bbe44390f273b1ebf7374edabb8b6accbe0f6"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.130.0/agent-compose-linux-amd64"
      sha256 "60e41de7da579b529402453abea9588c76df73be8c19015bc0dd36da02564ef4"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.130.0/agent-compose-linux-arm64"
      sha256 "4e050a420cf2699b75ff4964be33b99cc8bd339d665ee68c109f4f004f5c5c18"
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
