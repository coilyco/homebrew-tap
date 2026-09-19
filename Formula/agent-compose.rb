class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.153.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.153.0/agent-compose-roster.tar.gz"
    sha256 "189c4dea3155320a936a11f5c9d3925d08d7f3aaf8ed80628ee3cebd4e883c71"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.153.0/agent-compose-bundles.tar.gz"
    sha256 "678a390a4825666ccc0094f57d7eb10604eb5573ebe7acdc965dd167f4a98032"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.153.0/agent-compose-darwin-arm64"
      sha256 "52872a98ad0fe196df17740da0cec21d8dce37b4c4ae1b70d869c826808ff4ea"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.153.0/agent-compose-linux-amd64"
      sha256 "79318f07bab4007b0810db19fd1cab4ec460256ad3ed55bfd58285e7694821f3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.153.0/agent-compose-linux-arm64"
      sha256 "443a91d38c6fa5ce160f1733f9834199ddb96c40aed259f27dff1b77cf51d3bc"
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
