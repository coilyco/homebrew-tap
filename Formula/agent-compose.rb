class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://github.com/coilyco/agent-compose"
  version "2.218.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://github.com/coilyco/agent-compose/releases/download/v2.218.0/agent-compose-roster.tar.gz"
    sha256 "e5dbd908bcd97f51d172431f511c0e4217a1301d21a5ad7f72d8470495b71723"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://github.com/coilyco/agent-compose/releases/download/v2.218.0/agent-compose-bundles.tar.gz"
    sha256 "638e1390ba738489bb0c2c42175ab5ef3ed015e93e47c2d1a89dc860df1e0621"
  end

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agent-compose/releases/download/v2.218.0/agent-compose-darwin-arm64"
      sha256 "8b0bfb9f0155b5128bdf5fc54c09d0820603aa1fe413802877403fe4c23338a4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agent-compose/releases/download/v2.218.0/agent-compose-linux-amd64"
      sha256 "1d820c56dd26107c49725ec13bc930d4eafc4e8ada9edd7c21d906ca170fd6fc"
    end
    on_arm do
      url "https://github.com/coilyco/agent-compose/releases/download/v2.218.0/agent-compose-linux-arm64"
      sha256 "cbc1ac13f026bcb8e2ec7d80875b5427d06fd0762562e574570246e50e317598"
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
