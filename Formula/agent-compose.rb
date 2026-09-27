class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.187.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.187.0/agent-compose-roster.tar.gz"
    sha256 "9959f6a5c898fa986a9d1fdf5783776c4ff528a0fb5030bbfb9efd24158643a2"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.187.0/agent-compose-bundles.tar.gz"
    sha256 "b51f84aaff6e46a2e8d50bda7a89a439a09956b8e0e53040011172fc28104654"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.187.0/agent-compose-darwin-arm64"
      sha256 "7d14a4a435d4d114e9b7de1bd918737101d20e77d9e68c49fd8207778a702eb7"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.187.0/agent-compose-linux-amd64"
      sha256 "d6d391f31f9f4bdd6c40ddd3331b6b7d16ed31bd5a431e40956e677da87fda02"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.187.0/agent-compose-linux-arm64"
      sha256 "004b3a402ecdc458872f0052f33ec569ec1c8d3b956c1010e1092c7bef5163df"
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
