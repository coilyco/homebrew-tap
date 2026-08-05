class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.7.0/agent-compose-darwin-arm64"
      sha256 "fd486fab381af6f908ca87e272677533eee4200d5c58209d4534762af9b2b95b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.7.0/agent-compose-linux-amd64"
      sha256 "733bca64fb7f0b14e10daf7c4de1119b963bcd91299f149b30318b74e11f71a7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.7.0/agent-compose-linux-arm64"
      sha256 "de1c6fcb1e92a09276c2454c31fdb3ed6357fa73fb39e3cfafbca49927dc056f"
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
