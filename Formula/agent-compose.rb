class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.188.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.188.0/agent-compose-roster.tar.gz"
    sha256 "b37e1e4f48ac3731ac4efa89eee7e8b6eee896eff3a69647405e65c0cab19231"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.188.0/agent-compose-bundles.tar.gz"
    sha256 "9da8233bb9e18d253f58827a19b55dfcb706638655327aee3c9b02c442702294"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.188.0/agent-compose-darwin-arm64"
      sha256 "ec344c838987463fcfd78327ebdc227fff321c8926079edf8cef16625d5c79f5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.188.0/agent-compose-linux-amd64"
      sha256 "ae5c5f8e6ddd5c905377e0d7ffc2e46d53aeb670bd5c0d8d261bf3444ef7d089"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.188.0/agent-compose-linux-arm64"
      sha256 "dc125878198e7f03874fc7ea4633d23fc7aa48454ea0245b6bb297ba12aa3cbe"
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
