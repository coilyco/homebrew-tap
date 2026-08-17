class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.27.0/agent-compose-darwin-arm64"
      sha256 "d5488dd64c3d365b891433fd38e7476caaa6a9a2e9661c711cbdd790837131ea"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.27.0/agent-compose-linux-amd64"
      sha256 "51a0ba8d1a7b866012e24a0d504cc62ecc3be6139a51261f0a277570b6831a55"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.27.0/agent-compose-linux-arm64"
      sha256 "0edf238efb008badd05251e8c6a5c4385f2e8dfd04e9529620f27cfa0753ca3d"
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
