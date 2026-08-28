class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.72.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.72.0/agent-compose-darwin-arm64"
      sha256 "7aece49ec7a690d6cc4029381c2df79f865245d14d0b295e18b9f2ee6e2282f5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.72.0/agent-compose-linux-amd64"
      sha256 "0cc743a3b55639083a8e18a375eb150130f99a3348d826fa74a54b1a83b7845c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.72.0/agent-compose-linux-arm64"
      sha256 "439e0680b64ddb60aa6ec76c887aba216789bba6c29f48589a8a843df30e86d5"
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
