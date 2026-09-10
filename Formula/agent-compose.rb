class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.110.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.110.0/agent-compose-roster.tar.gz"
    sha256 "1693a2ba546eda717f97252ec6f4ac1fcf871d9757292d9a5bcf4515c713242b"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.110.0/agent-compose-bundles.tar.gz"
    sha256 "274bb7b353129fc090b561b4c24b5b82cd3c4f217424551e875fc723c1cc93f4"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.110.0/agent-compose-darwin-arm64"
      sha256 "985946adf8b832b5f8eaa58e280d243d314a2234b0b4bf5dfe9f97f219e5eb48"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.110.0/agent-compose-linux-amd64"
      sha256 "3d38c52522c20fd472a07286756f1d37ac5f4435d1af2280aba52838703c0fad"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.110.0/agent-compose-linux-arm64"
      sha256 "e1ce4f3c32fb282f0cfd74e7e6758e2a469c1f4eb3f7f02d65900ce5d20a9329"
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
