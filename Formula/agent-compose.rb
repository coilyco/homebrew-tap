class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.182.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.182.0/agent-compose-roster.tar.gz"
    sha256 "158835bf14d295b89e68190a1ac2a2e4d5dfa9ecffc63fa3dd8dec8b935fe4e3"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.182.0/agent-compose-bundles.tar.gz"
    sha256 "55544ffa06e7624e5ed2ae0a79e43104ad1c81e3825ef2254cf59e67bc321869"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.182.0/agent-compose-darwin-arm64"
      sha256 "edeb732260746a4f185c43e4fbf030c1ca5c1815806ac8c3371e4572df24c33b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.182.0/agent-compose-linux-amd64"
      sha256 "244cd9e6f775bbcbaaa90c735639fc30b61e22e94015acebfe339e60ebe97424"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.182.0/agent-compose-linux-arm64"
      sha256 "423f4967d140c091a25b36a76f39153e0869e5c69b5ba9046f544fe75d6bc082"
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
