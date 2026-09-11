class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.120.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.120.0/agent-compose-roster.tar.gz"
    sha256 "9301bf050e5257a59d237a89bd96dc7d6a391cb7678b68fbca7fb93ca5fad679"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.120.0/agent-compose-bundles.tar.gz"
    sha256 "6609c84c82fb8a3c71fd029df9b1042e8b3f8daf799c1178e6276ea640e16d8e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.120.0/agent-compose-darwin-arm64"
      sha256 "155a053936f228ab374d651b255462695fa8146efd76e4d5220033796d7437ad"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.120.0/agent-compose-linux-amd64"
      sha256 "c523d9c8d3e13be57f9f030940775dddfb7b3a201219025241585fa119c77aed"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.120.0/agent-compose-linux-arm64"
      sha256 "85e378605f3330a2a22b6e149eb7fd3dbf973f0bc06acf13b8865d58e8564493"
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
