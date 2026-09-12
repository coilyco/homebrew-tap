class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.134.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.134.0/agent-compose-roster.tar.gz"
    sha256 "0d84e89b6ad643753079008a7fbac25a40f0d11fe0c7c0655091dbfd985b0b80"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.134.0/agent-compose-bundles.tar.gz"
    sha256 "d387c0bddca4f0d161c34028040d1d4a0cf34c518d380b5a006a05b5916408fd"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.134.0/agent-compose-darwin-arm64"
      sha256 "cddbfaf61b4bc701ded4170b9c716d5bc59e18e7b0f6c73c093948da0520b06f"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.134.0/agent-compose-linux-amd64"
      sha256 "b866abb6237862006dcadf18768373b11267937a03eb83c1c91c1ad1e32e403b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.134.0/agent-compose-linux-arm64"
      sha256 "7ec6dfec5cf84fa9ef94c394281134905b1923c6d2357e974f4ee0360719c199"
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
