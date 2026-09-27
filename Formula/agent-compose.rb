class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.184.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.184.0/agent-compose-roster.tar.gz"
    sha256 "c83a06a58514ba0059927a73fcf7c166a659f4e56c7ff0a5a8f22e46c40706c5"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.184.0/agent-compose-bundles.tar.gz"
    sha256 "38efb14cb2d5fd84273f24acf842be303774ccdd24e64b8469559283a0fdb59e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.184.0/agent-compose-darwin-arm64"
      sha256 "773cf82a9b66330bfc2e633a80a533a040911cdfc8c2faee998fd8c36577fb40"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.184.0/agent-compose-linux-amd64"
      sha256 "75994856d448b54f4089540a866ce8ce81cf93482522a86465d17a3611bddeac"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.184.0/agent-compose-linux-arm64"
      sha256 "f145f6f350adb988a28b2bfb1a52d0c17522dc97be83e33c41e9b7b05fdc980f"
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
