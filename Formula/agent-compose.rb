class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.159.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.159.0/agent-compose-roster.tar.gz"
    sha256 "380b06a58795864630aeaaab63bee14cdd3b5cbd8543940b8e04995646fc867e"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.159.0/agent-compose-bundles.tar.gz"
    sha256 "0a13fc35d8fc705bfc09cb2f0326cea9bc77f5fa82433413083445649bd7ec43"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.159.0/agent-compose-darwin-arm64"
      sha256 "eaa98baa8ce57e8d2b7117ab5daaf9b43777b19d4440896de967e2d1219fa8bb"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.159.0/agent-compose-linux-amd64"
      sha256 "b4a1e240308e23a6a21214f4c05636d6283fc917f37a84648f3901bee54412d1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.159.0/agent-compose-linux-arm64"
      sha256 "28e9410f5e8a445e4f12af837e8ff66b8c40aee95d5a09aa853967b6d65e3b38"
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
