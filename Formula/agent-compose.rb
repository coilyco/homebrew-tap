class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.115.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.115.0/agent-compose-roster.tar.gz"
    sha256 "37166ac6b1bd6cb7044ae325640fbd8c0a9d98363e300ebf766e791e8a510747"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.115.0/agent-compose-bundles.tar.gz"
    sha256 "e25a3885cf466ea731cc943735b473648b8629aebe053bf1afa09a8e87181a5c"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.115.0/agent-compose-darwin-arm64"
      sha256 "8c0826726bdc7e96fbaa1259eb5bcbd15f9e86dd1c3b749c6d09028f7f38093a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.115.0/agent-compose-linux-amd64"
      sha256 "f1c3f04f9f813c0579a6bf4afb41c8de133e58bfbc3309c6ac98a457de4569f0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.115.0/agent-compose-linux-arm64"
      sha256 "b39328e90bec0c21d3ff0eb4f8a3466a6427740ca37ac5d1a8ceb850dd512c50"
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
