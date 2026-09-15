class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.146.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.146.0/agent-compose-roster.tar.gz"
    sha256 "e030b4c421c296cce686a6f2b0d679573cea10f2b5fff9367ec206c22fef688f"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.146.0/agent-compose-bundles.tar.gz"
    sha256 "619641cc3ecf16b780ea6fd1622a4c111b499a216e9fe20f79b8cb1b23299677"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.146.0/agent-compose-darwin-arm64"
      sha256 "22807adeecf5c55d2cb987745f6e60d20fc36f05af429234a5572fb47643b960"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.146.0/agent-compose-linux-amd64"
      sha256 "0a2c7a278bc841e6563ff822fe9eadb541b294252e34bb8f0ee82e79853721b4"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.146.0/agent-compose-linux-arm64"
      sha256 "d4f64bae15ac4376640bc7e9d88e55cfa001e2faa353d8bab1ddd038c9f1341a"
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
