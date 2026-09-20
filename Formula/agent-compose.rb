class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.155.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.155.0/agent-compose-roster.tar.gz"
    sha256 "fd87f25443fd65a491e27a780dafd6f2db0afe6728e83bd75e0f39c3b46a2467"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.155.0/agent-compose-bundles.tar.gz"
    sha256 "c787d8618f82e9fe08814ef07c7dcd88d147049775b8fced47738678e38fe64f"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.155.0/agent-compose-darwin-arm64"
      sha256 "acde3309b18956794d58fdf000f23ad5150c55a244c5c7c8e5fa62f4fffff3a5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.155.0/agent-compose-linux-amd64"
      sha256 "03330a13b42db4cf08e31082445b2d20f756da2f9b02c45176b36ad21bad7b73"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.155.0/agent-compose-linux-arm64"
      sha256 "270af33cec9978003d5881416ba6f16ddddadd1418ade44e19bbfccf5684805d"
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
