class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.189.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.189.0/agent-compose-roster.tar.gz"
    sha256 "1b5ed10230eb637019a224cb45331fe469d50ba72104deb9e5a13c48ecf5572d"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.189.0/agent-compose-bundles.tar.gz"
    sha256 "4b47faf38bf7a327f2803d4ad02f156afd7b8680f30af8f9c45972a8f5b683ec"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.189.0/agent-compose-darwin-arm64"
      sha256 "abe53f7d9936bafc6b1385ab2b30c66b81001c43789f2ac8e68b69ed4012c30a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.189.0/agent-compose-linux-amd64"
      sha256 "af80bcf28e9003746b8f7b696adf92fa74bf6053afbf671c0bd1bd47d2d287d6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.189.0/agent-compose-linux-arm64"
      sha256 "05df82a22067d7c7c2d6088f25dccf2acee569de759fdde8370f1f70ebf215d8"
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
