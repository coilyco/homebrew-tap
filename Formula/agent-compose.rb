class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://github.com/coilyco/agent-compose"
  version "2.219.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://github.com/coilyco/agent-compose/releases/download/v2.219.0/agent-compose-roster.tar.gz"
    sha256 "3baee588b36f462e9fb51c33a47e3d0e8596ac993f42a6cd2a1ff2037a8c3461"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://github.com/coilyco/agent-compose/releases/download/v2.219.0/agent-compose-bundles.tar.gz"
    sha256 "8fdee4d86050a4a8dc359ab1f41eed2307e73b16cc66170b99b26f911a551c69"
  end

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agent-compose/releases/download/v2.219.0/agent-compose-darwin-arm64"
    sha256 "1b49bae7e9108106f5fc46be36c7489f504d37edcffec4893e2a975907463ae8"
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agent-compose/releases/download/v2.219.0/agent-compose-linux-amd64"
      sha256 "2ef954ef4ed309602ba5e441a2d6f103f62e5086c1c90c5dd7a782e6d9ff4cf2"
    end
    on_arm do
      url "https://github.com/coilyco/agent-compose/releases/download/v2.219.0/agent-compose-linux-arm64"
      sha256 "4e3b7b868ecb14943c8f977b6da19c168b9f98daa0f4824238f05dd9349ea67b"
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
