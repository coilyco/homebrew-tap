class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.78.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.78.0/agent-compose-darwin-arm64"
      sha256 "a5863d901691b7f8ff9fca05ab2f3f5206b02888699371114231989d1c70f274"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.78.0/agent-compose-linux-amd64"
      sha256 "3598cf496e51c6090a62a4977d03149f22d754165465bd172300810a429cfc2d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.78.0/agent-compose-linux-arm64"
      sha256 "8007b966dd7b6af06176a1289dd50afa998e55954fd56c024d7aad3f197a729c"
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
