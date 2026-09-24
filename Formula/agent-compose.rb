class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.169.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.169.0/agent-compose-roster.tar.gz"
    sha256 "31eb8c884c9013edcd6200064a11c11091eba078f5604788427b90c622fa72a6"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.169.0/agent-compose-bundles.tar.gz"
    sha256 "e5ef0044fdb9ef79fb0ca89fec5dab2c6398962f6283a2f8c252050317f3ea78"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.169.0/agent-compose-darwin-arm64"
      sha256 "9d2b21bc0dc3ba2d6ee8126ecaf54b082327441fe01e986dd4b0fda916cad6be"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.169.0/agent-compose-linux-amd64"
      sha256 "2b3d33b4770dbb96471a0d0bdf0372356aeb65fa511ac1823b75cb87a0b58eb3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.169.0/agent-compose-linux-arm64"
      sha256 "2b8352ce7348676b4998a80e1375f79267fa3628daa7556eaf3bf14bfe31ec29"
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
