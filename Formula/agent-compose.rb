class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.29.0/agent-compose-darwin-arm64"
      sha256 "712c9c324d21c4a66a4eeec2aeaf74b1b0018ff6107b44476cc8af964d710c07"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.29.0/agent-compose-linux-amd64"
      sha256 "8de3a1e572c43e5e557ec4561325dd2ec7f172855400b5159d741bab7312375f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.29.0/agent-compose-linux-arm64"
      sha256 "a07f1cd4893249197704be5d6067a2a244aad5f5142673329291fbcaa831659d"
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
