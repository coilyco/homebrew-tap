class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.111.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.111.0/agent-compose-roster.tar.gz"
    sha256 "c297e242e381e995d9228a5cd6f05d90aa635aa1f996a8ad85e47fa2f9f76699"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.111.0/agent-compose-bundles.tar.gz"
    sha256 "66dfc66b010ac618e42cf6995a023c8758ee9ba1f6563b4861b94314ebc7b0a1"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.111.0/agent-compose-darwin-arm64"
      sha256 "416ccc8f23df418bd0313ba3ce57658bf9543996604ada75a2878af9c69562ae"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.111.0/agent-compose-linux-amd64"
      sha256 "a5a9f13d4ef402b067578d12882da0365411d3abee5702723b80f9be9b296583"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.111.0/agent-compose-linux-arm64"
      sha256 "703bacd6b3b95a8b6b96fdd82a82dc168107b27f7554bcc33ae55b2493b9864f"
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
