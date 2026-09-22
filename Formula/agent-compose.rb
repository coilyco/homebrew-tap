class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.163.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.163.0/agent-compose-roster.tar.gz"
    sha256 "69c58c4bf82397d7834164cf23ab92f815cd6e5ecaef47cc82fbc61f669e4cbf"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.163.0/agent-compose-bundles.tar.gz"
    sha256 "e9f7291ee3046aad5dbf037448d90d6bfd1b2cd4191e41dc6c8f30213510d77a"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.163.0/agent-compose-darwin-arm64"
      sha256 "e4a8a6654e33869490f7e990452c546ca99422831a3fe90383aeed4ab0ba8666"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.163.0/agent-compose-linux-amd64"
      sha256 "50577c3ef9d339de14556260b3ada39f834eb75c26f312a34e26901ef6922588"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.163.0/agent-compose-linux-arm64"
      sha256 "3e2b8fff198c07facc288024a42403b1a71b9e5fcac4ed5859354a3633c28c3c"
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
