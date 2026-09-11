class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.121.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.121.0/agent-compose-roster.tar.gz"
    sha256 "2f058ac318364c278205c73b0f2ba9f44fc655845fcadda503cd4585e8ab9014"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.121.0/agent-compose-bundles.tar.gz"
    sha256 "641add84922a98e9d79c360dcab4a5068a0aca5b790a1e94724c46c6e3842da8"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.121.0/agent-compose-darwin-arm64"
      sha256 "3c5a09e0e5cbe4a27e542be0d1a53f9e8f71c249b8674e378f907d06ffda6f1d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.121.0/agent-compose-linux-amd64"
      sha256 "db300a277f10bf817f46233e27d283ef9c8d1978e0e4b878ddf968df948950a4"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.121.0/agent-compose-linux-arm64"
      sha256 "dd51b1259fd91d612cf1c2c66ea630832e2d91ebd3408d2a457efa13202d3444"
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
