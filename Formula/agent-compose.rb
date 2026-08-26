class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.61.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.61.0/agent-compose-darwin-arm64"
      sha256 "cd05f1596743d9068e42074a2fcc45a7f351cd3f566a52501005fa6021d53f8e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.61.0/agent-compose-linux-amd64"
      sha256 "ea63c69674952d01610e3a731bd2d7eff0cc8603814500548a3df03ad3df83c3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.61.0/agent-compose-linux-arm64"
      sha256 "ab9cadf9fcb9b10ff58b9bbf7c10e727a001584ed0ce5a29d8c47debd85e7afb"
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
