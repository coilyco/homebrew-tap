class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.77.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.77.0/agent-compose-darwin-arm64"
      sha256 "2ec47355dd68c8b32f8238549c7d6257e4da26d68bf937b78a33e94dbd58a31b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.77.0/agent-compose-linux-amd64"
      sha256 "60d88b67954bb358f19ef299ae855266159172c273cf9c36b0e74ee017b25ba8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.77.0/agent-compose-linux-arm64"
      sha256 "ceba350a3dce9b5e55fd314736b2a93600ba36df7674a2291609d010dc809813"
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
