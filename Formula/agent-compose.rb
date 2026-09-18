class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.150.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.150.0/agent-compose-roster.tar.gz"
    sha256 "e87900e21040cb5d09b154d5abcca245b7f06906f9f4b7caff6ca49eaeb2dd11"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.150.0/agent-compose-bundles.tar.gz"
    sha256 "f8740ba0e8c2687cdfae1612c83ce9f9bdbc4c389ad8aae00ba86d05c9f596b5"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.150.0/agent-compose-darwin-arm64"
      sha256 "ef6aa1b798862c1460af143061a40906c8e19e3e5778362db94e07dfe5a6a25e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.150.0/agent-compose-linux-amd64"
      sha256 "9dbd75bea6d250f0a869faa7c50f88aa84b93f4ca7fea17e7af331633bf08b3a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.150.0/agent-compose-linux-arm64"
      sha256 "6be27dfceb8979dc65ba733f59dbfa56f2dd379b1b830ba27d8a3bf8c515a40e"
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
