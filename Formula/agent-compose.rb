class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.96.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.96.0/agent-compose-roster.tar.gz"
    sha256 "3cf74dc48135b717c7d024967b33ca374b1da33c0e33770d01f0c185b39e90ca"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.96.0/agent-compose-bundles.tar.gz"
    sha256 "0154f2421b4315b68f096f8bdbe6b0066efdab395285d991e3f853094158f74e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.96.0/agent-compose-darwin-arm64"
      sha256 "cb624aca03a3030e6a99f64d070529222f0f73c819b505f5780d07e4ab1d584d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.96.0/agent-compose-linux-amd64"
      sha256 "ffaf9c5592c641335a9ec2b0432a3c8918f251020ee59edd214634629e2ef1bb"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.96.0/agent-compose-linux-arm64"
      sha256 "37c43ad01156574be33fc0e24d25532f59a7ab9fba197a39a4f9178632058a85"
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
