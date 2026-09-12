class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.138.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.138.0/agent-compose-roster.tar.gz"
    sha256 "17f98aff49184164ab53368f5c2014a7069c7eb0ea9ce4f88eb76693d220e0cb"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.138.0/agent-compose-bundles.tar.gz"
    sha256 "fab16081a044691f5966e1bcfd541b710af7f210ed397c2bfb3775c337fcc2cd"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.138.0/agent-compose-darwin-arm64"
      sha256 "817ac2d0b366f08afd60385e90e16207b6575feb341ef1da7bc85323f13ab019"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.138.0/agent-compose-linux-amd64"
      sha256 "3f3284824c6f3f431ee1cacc1e17d20ce2e24172f657808950afe4cb36468db3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.138.0/agent-compose-linux-arm64"
      sha256 "6422b457a4b28ad521e34e8385d6216f3b0802ea006e5142f37299eae6b8de8a"
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
