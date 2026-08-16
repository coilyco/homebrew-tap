class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.24.0/agent-compose-darwin-arm64"
      sha256 "0dcf331ddfc04fbb01f2288cec27b4b1250d04dba2f7f4dfd52e8e72b61f3258"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.24.0/agent-compose-linux-amd64"
      sha256 "c06cf6e34d687e0253a6c504c79f12ad2a2a88c4e1e1fde230c3c85c5f714f98"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.24.0/agent-compose-linux-arm64"
      sha256 "841d8eddfb6821331f3c46edcc2ad6cfd472a4609a5601cc2790fff205ab1338"
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
