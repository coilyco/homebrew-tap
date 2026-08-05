class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.10.0/agent-compose-darwin-arm64"
      sha256 "777429f989e40473c8e63b92b05487f2fe6bcd106211ca90f8baa38c20a05c15"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.10.0/agent-compose-linux-amd64"
      sha256 "235908ba30408da743d6423daac0b26c582d567097bf0fe8b80fc43b84ce55ab"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.10.0/agent-compose-linux-arm64"
      sha256 "4684566d5e1d0c6ccbe5ac8c494202b1edb662cb29c041f1c622ffbf29b58ba0"
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
