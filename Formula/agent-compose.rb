class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.131.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.131.0/agent-compose-roster.tar.gz"
    sha256 "afc2be2394697b31567512ae62ce2df8816086da8ef2c448ffe0996b51f645aa"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.131.0/agent-compose-bundles.tar.gz"
    sha256 "60786512792f519f5d440e44398cd764c922901b790f3f62417436db9747ba04"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.131.0/agent-compose-darwin-arm64"
      sha256 "7667af2647bb6c9739aaee7d8cd91b943370b0830f87ed135e41c31dc4526475"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.131.0/agent-compose-linux-amd64"
      sha256 "195a4642d3c35a322f6272fccbc513128fabd98a263084bdfc914ec93702b839"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.131.0/agent-compose-linux-arm64"
      sha256 "e8e336d811758ddb74e9a091a8124acb0b94efb62471d41cfbd0cec5e7b3ffc8"
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
