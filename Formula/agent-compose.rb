class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.178.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.178.0/agent-compose-roster.tar.gz"
    sha256 "aa81f3ec00724e567b5c22105f40a0e94bf4b9dd45a3f5219a26e03f1083d2e7"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.178.0/agent-compose-bundles.tar.gz"
    sha256 "fe4ef1c2b31a89e628df538cd75b7a960d2d2c9ab5b7a5d13f3a339956e2b94e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.178.0/agent-compose-darwin-arm64"
      sha256 "3675dd356058972f011073848182929b99ed3b8ea449cca9a08b161f5a74c2aa"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.178.0/agent-compose-linux-amd64"
      sha256 "1b0b3648768e4086ed5a0f3fbc0a46bbb30a4028943ed1df5cf7c400736a528f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.178.0/agent-compose-linux-arm64"
      sha256 "8d8c2155f68de0969181be9961bc48cfc1a04ca8b1085ce6e34b72c91480e725"
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
