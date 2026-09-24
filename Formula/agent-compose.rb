class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.172.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.172.0/agent-compose-roster.tar.gz"
    sha256 "2e1e80749fba9251123cc31fa32505266bffa6f42b9e3b6d256c8634326a29cb"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.172.0/agent-compose-bundles.tar.gz"
    sha256 "c8715b7c59547cee7acea6acb831392bbe7be6317c1a5f6d3aab47397c71aafe"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.172.0/agent-compose-darwin-arm64"
      sha256 "14f87531699a3c924d62b11da954dc9176fa0e62240b41732944a52d68fb637f"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.172.0/agent-compose-linux-amd64"
      sha256 "195af6f3c7bc33894eade02404b25fbb9b51ef7a2eebbab4d0fe1becc28ccbb8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.172.0/agent-compose-linux-arm64"
      sha256 "0a0c8c837edbf46e7c59d4f79c832ab56f62d05ac436d710c1b2b63f22db1ada"
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
