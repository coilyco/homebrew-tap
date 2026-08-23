class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.43.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.43.0/agent-compose-darwin-arm64"
      sha256 "a2571b4c4ac0294669542a22403e7032e99a4cab34e85f0dbe92a065aec29c68"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.43.0/agent-compose-linux-amd64"
      sha256 "5bc468dcbe7f78da37f26200bbf5b332a56316e1d76eb28f0b6fd53adb2cc34d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.43.0/agent-compose-linux-arm64"
      sha256 "4db0a5557d33bf79410a8d4d8399c49fe22a9b063140bb224afbd134e8c08cf5"
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
