class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.164.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.164.0/agent-compose-roster.tar.gz"
    sha256 "2f74b4bfe364debbaf929495db5d7895c899b0ce45b426a6ada05f276fc5b636"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.164.0/agent-compose-bundles.tar.gz"
    sha256 "6fcbb68d66b08de80c7d8f581cc45d205e2773eba9701a8ab6508bd2110dd786"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.164.0/agent-compose-darwin-arm64"
      sha256 "43b34363ff218dda36f95b9dbe04d74ad8a71cbe035d5887c1bd80442f8f1be2"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.164.0/agent-compose-linux-amd64"
      sha256 "743b86bb45153c82ce6ecb0f783291344258b0fa339dfc0c8f62b89dc02904a6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.164.0/agent-compose-linux-arm64"
      sha256 "fe9b67102fc2051421652b66569e36d2f41041fd66ce89f3e1b9faca1dd1a79d"
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
