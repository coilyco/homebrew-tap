class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.132.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.132.0/agent-compose-roster.tar.gz"
    sha256 "a00c8d899c646e02ad1ff39d40b0a68294f35e479d735f2837bd5f926037300f"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.132.0/agent-compose-bundles.tar.gz"
    sha256 "76ce58ed519a0d8f753dd39985049533a24c466919b7679b3a7d6bc82a4e94d8"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.132.0/agent-compose-darwin-arm64"
      sha256 "623d97a1eddf35fef1958707ee0d4c65401db9855fbf0b6b44612a107754d101"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.132.0/agent-compose-linux-amd64"
      sha256 "a400f0a495a22dab0ba40ffc50f1cd40042b10c1d10ba4d8081317532f950f2c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.132.0/agent-compose-linux-arm64"
      sha256 "c2e96146b0cf9177cd1fce1f9c4de70b90dac3ec158e02f8d17cfd830c3d1146"
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
