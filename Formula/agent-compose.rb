class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.170.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.170.0/agent-compose-roster.tar.gz"
    sha256 "f8758495d7e355f6f6cf3fd032d0cb077f27b3c357051b10949312a4efa3e424"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.170.0/agent-compose-bundles.tar.gz"
    sha256 "b7be890de55db65a5bfe0a0e4c10ea802e84d0f0b6f9108854bf9efd3b9fed43"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.170.0/agent-compose-darwin-arm64"
      sha256 "93e928881fe3cdb136f0c1947df6e03d874bbcb21e7eede450c4e38376a519f7"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.170.0/agent-compose-linux-amd64"
      sha256 "09ca891ab9102f2d30345fa23c1885c8f37a23f8183e082f5e5aa1c5cd32d96c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.170.0/agent-compose-linux-arm64"
      sha256 "5e1575eb4f961033d090f78a5eaa66131880f5258485b0e2620c5445838fc907"
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
