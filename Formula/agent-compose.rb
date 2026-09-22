class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.157.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.157.0/agent-compose-roster.tar.gz"
    sha256 "350ba5421a66351a7f295283e5f9a1b7e5d44fc0606b11017cc570eb09cdb724"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.157.0/agent-compose-bundles.tar.gz"
    sha256 "a92d1580e6fe70d3b1e828200a9823bc6a5a74c971997fd82755ee6a331b106a"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.157.0/agent-compose-darwin-arm64"
      sha256 "eee7f3a1f83dec2bc61f4fc6192e875e79a56f1a62834380847caa6971fc62e5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.157.0/agent-compose-linux-amd64"
      sha256 "31d5837ade61076949bea8edbefa701bea7019fc51a6d039b1c20c41285681cc"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.157.0/agent-compose-linux-arm64"
      sha256 "d51d3194853d083755fd57f4ab69cfb141b51edb626210b4af771dce11ebec66"
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
