class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.103.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.103.0/agent-compose-roster.tar.gz"
    sha256 "a594d979caa16de1b94591fe5e8ae2389e46d8cb19c04939650d39568033c2c4"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.103.0/agent-compose-bundles.tar.gz"
    sha256 "f8bf615d1377a66db53919789e378d9a21196383205517a04222ee027520f1c8"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.103.0/agent-compose-darwin-arm64"
      sha256 "979d10a3aaae0de5b93b56bb71e619904fbeadb6897f7ba68ad077d56b3758f9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.103.0/agent-compose-linux-amd64"
      sha256 "4d44af2d6d39456a1c4dfc1676174f4febb1114505772a247caa9ba844fce513"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.103.0/agent-compose-linux-arm64"
      sha256 "770c7aeb23344a902715d5c15f759929c86caa136d0cd79acec3aef263ed67f3"
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
