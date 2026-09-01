class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.83.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.83.0/agent-compose-darwin-arm64"
      sha256 "0a29088683227197559c8893663f226c92fcd63d7af633ab33b86ed1612c8a31"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.83.0/agent-compose-linux-amd64"
      sha256 "6d9160ff763a1b03514faf1af5aecfda8a505cf70fa03dea7be24fd71fd5e9c1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.83.0/agent-compose-linux-arm64"
      sha256 "c1cd880abd3f782b91ebc9eb5d1f12f29d04d6e8da53a5414aac8afd6c21f4c7"
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
