class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.152.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.152.0/agent-compose-roster.tar.gz"
    sha256 "d971b0a326ab6cd3af29919013869f64424a09af1d97cfb045b86d99c856c6ab"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.152.0/agent-compose-bundles.tar.gz"
    sha256 "5692c7ab5808817bbdaa4a62e3453d9dbbc33be02d2e14c08e47bff0c5c6f3e8"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.152.0/agent-compose-darwin-arm64"
      sha256 "1fe34c4b22f2947a4b12329f0a146c14b8442983fed812dd0a821b25a6052601"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.152.0/agent-compose-linux-amd64"
      sha256 "d29fd31003fb3ad4a0230c4e6676ec9384956eb1dc9e3245c54cb7262cf8fa3b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.152.0/agent-compose-linux-arm64"
      sha256 "d625c302a5777eddb6c92df0da00178e012cc635e9f454b8080cef82240250a9"
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
