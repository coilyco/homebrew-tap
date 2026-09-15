class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.142.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.142.0/agent-compose-roster.tar.gz"
    sha256 "198548e784a33295b7d949cd4b4889f75273044ae06b5d3256ab684067f67114"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.142.0/agent-compose-bundles.tar.gz"
    sha256 "4c66c697dfc2cb6911e841419b28af44431558a6ac93d6bb9d772392a618e447"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.142.0/agent-compose-darwin-arm64"
      sha256 "e2861077cb1606176eb06ac5299a7484be19403433e53045b7c6643505ded416"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.142.0/agent-compose-linux-amd64"
      sha256 "03821fc994a18ca0eb7153bb8cc4721c31b6ab8f76f4fc1ffb1c6e9570aad4b5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.142.0/agent-compose-linux-arm64"
      sha256 "fb521f5145c81eb875b7feed08bcdf52acbe66363148d1e7e47d30b9d21a0687"
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
