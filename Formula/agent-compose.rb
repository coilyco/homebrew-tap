class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.165.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.165.0/agent-compose-roster.tar.gz"
    sha256 "2486768ad83b35c331f02f2c7eb8262fd93f92f1250643963446ccde42f4baf6"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.165.0/agent-compose-bundles.tar.gz"
    sha256 "963ffb87149aac633ea2e155dd6163405b7d8422e056748f144e759aa3055e43"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.165.0/agent-compose-darwin-arm64"
      sha256 "aed891c4953eda1a011205dbf24caf1d7133bfa04be5d2bd9562bad8cbcb2150"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.165.0/agent-compose-linux-amd64"
      sha256 "ccf9ecbbe3281b40f5d40bc03ec25b4bf8be11271cfa59bbf198161cbe711418"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.165.0/agent-compose-linux-arm64"
      sha256 "7a0b63da2bdf352bbadd2cc4aa7f51cfe09cb0d94f522e3587857e65331d0081"
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
