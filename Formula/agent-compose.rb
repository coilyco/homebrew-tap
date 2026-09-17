class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.149.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.149.0/agent-compose-roster.tar.gz"
    sha256 "81162f4f302b83bbc038bdb30b1071ffa848d10c131be4334b62478de6ab193c"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.149.0/agent-compose-bundles.tar.gz"
    sha256 "c1bdac6917e6ac10b47ab99f44424918956f9d15e723a58cd207a50aa00a8902"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.149.0/agent-compose-darwin-arm64"
      sha256 "cae7e6154701e221d1bb9a3456badf39ba8f4c9b2cb7880f7da9e24c2e8da865"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.149.0/agent-compose-linux-amd64"
      sha256 "f5690cce826903b6b9b02853a7b224ed7371883c1f9e84cb25b976511963054b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.149.0/agent-compose-linux-arm64"
      sha256 "4f38b0c5a8f36b0c46b1898a7346df00f621e93b1c5454465fdfecef793c82e4"
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
