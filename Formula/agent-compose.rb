class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.37.0/agent-compose-darwin-arm64"
      sha256 "5dc908c26a26aab04a043eaf852cadf8e64f3be9a29933772675dbd012dfd99e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.37.0/agent-compose-linux-amd64"
      sha256 "2de2e3bad040ac4aef198d7914a32192d88793db6bb73a80e7b2e369cde7863b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.37.0/agent-compose-linux-arm64"
      sha256 "2735762b83842f81dca2f6674c8688836412fcf6d030680640b7819266c6417f"
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
