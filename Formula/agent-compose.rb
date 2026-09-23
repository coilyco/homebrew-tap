class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.166.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.166.0/agent-compose-roster.tar.gz"
    sha256 "7c8f04fe48059228b9a4bce07e31d6d4ce0e1d6f07202ee1763b2b980cde6c32"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.166.0/agent-compose-bundles.tar.gz"
    sha256 "ba24372a950f00ce507d88c6848933594f5904cebff5ac27d31fcaf69403f1a4"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.166.0/agent-compose-darwin-arm64"
      sha256 "b6bdfba955bcdd547f430360fc039120e3fedcbfcb8a640ed8ab42f001ba732d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.166.0/agent-compose-linux-amd64"
      sha256 "6ef8beda1dfaa57cf9b628271314db8e62157d1f0a935a8c41c4045c446b79c5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.166.0/agent-compose-linux-arm64"
      sha256 "786d923ed1c0e9a6ce1dccefe9fb6a943e500cb8261dd24f67178900b65821b0"
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
