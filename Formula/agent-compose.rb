class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.82.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.82.0/agent-compose-darwin-arm64"
      sha256 "3079da9d6a0fccbc6f3873a9a373853b53b1e993b65cc075cd0c01d8a42a1a1c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.82.0/agent-compose-linux-amd64"
      sha256 "e7eee87ba679fcc1322c377109051c319e3abc7b640dc5c19bda74c6e595b65a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.82.0/agent-compose-linux-arm64"
      sha256 "dd139fabe3028cf195ad0777830d903e62d08008ce6ef4b84c164a6cd84cac6e"
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
