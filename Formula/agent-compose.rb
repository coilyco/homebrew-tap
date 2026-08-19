class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.32.0/agent-compose-darwin-arm64"
      sha256 "5f0f27b2fb29ff205d4fb11c1eb80fcd35e8465a8e8dee04d0a74cab6afc1f6a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.32.0/agent-compose-linux-amd64"
      sha256 "e61ff8ab3832809c1c3afe3e9ecccce45f882764605bfa2a982dc17e27592448"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.32.0/agent-compose-linux-arm64"
      sha256 "ad5055665d22008419a08b7788aac3cd578be9975918ef923440be52fc9a4a76"
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
