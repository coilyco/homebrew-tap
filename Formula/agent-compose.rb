class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.76.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.76.0/agent-compose-darwin-arm64"
      sha256 "11172d1d4c9b5d6d1edfbeeda4ccccc832072a35bf41781447d65f70d4c14e16"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.76.0/agent-compose-linux-amd64"
      sha256 "488fb494df27de255c965f51c8839d9bf1eaa6771dd39d41937137a37e5c3803"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.76.0/agent-compose-linux-arm64"
      sha256 "be949d0c76b9c51e4167b9471690c57cf0af97c9b68e15773a697809bf376ba6"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
