class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://github.com/coilyco/agent-compose"
  version "2.220.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://github.com/coilyco/agent-compose/releases/download/v2.220.0/agent-compose-roster.tar.gz"
    sha256 "ef7c31b352077eb7e472c48b5f7b5b223f0ae89315b21a9972826846c44321a1"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://github.com/coilyco/agent-compose/releases/download/v2.220.0/agent-compose-bundles.tar.gz"
    sha256 "c737ed5da63cec89b3ea190c2d2e9b18351b17e7792645f72efb8c50ae31c487"
  end

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agent-compose/releases/download/v2.220.0/agent-compose-darwin-arm64"
    sha256 "e233a5729a409d079b4096511a36812eb7b0df8fd545b5c80eb8698eb64a7640"
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agent-compose/releases/download/v2.220.0/agent-compose-linux-amd64"
      sha256 "a63307f0646953e93c5b363a5f10ea959a7b8c2b803afd4aa5bd73221de563b7"
    end
    on_arm do
      url "https://github.com/coilyco/agent-compose/releases/download/v2.220.0/agent-compose-linux-arm64"
      sha256 "5df8ea44f12114abe569068ab27281619bcf8e9a9c4a67ee0b2f225fdc97900b"
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
