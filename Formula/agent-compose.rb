class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.17.0/agent-compose-darwin-arm64"
      sha256 "5a425a1cb662eb4e7041104ce267a21ea3dddd927a4cd2ec0dbfbec95a1346ad"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.17.0/agent-compose-linux-amd64"
      sha256 "713f23e5c83eac0536cdc559ab4a3a4176fe6bee7daa0b6dfdb4cab1b3c67298"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.17.0/agent-compose-linux-arm64"
      sha256 "007cc11b1aab658ea4e8dfa7f3d2be90a47b18a8c3d2ce8f594ab391e247175e"
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
