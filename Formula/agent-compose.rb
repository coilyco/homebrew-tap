class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.8.0/agent-compose-darwin-arm64"
      sha256 "529ce2fda10ef979d32786938cf4f270f5391217613d99c4e01c78f87f7f1103"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.8.0/agent-compose-linux-amd64"
      sha256 "f3795b295e2f921c649d366300afa918b62d3846328ce5a814d2b64e9bfaa13b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.8.0/agent-compose-linux-arm64"
      sha256 "bff230a35704694ea08eccb2c01491a7d706452c22f3ecf2f3c607dbb774b5f2"
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
