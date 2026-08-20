class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.34.0/agent-compose-darwin-arm64"
      sha256 "296957f22a4a84c73e6dc0405df867eb1674f6d08016131b43bd54f859b2d0a9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.34.0/agent-compose-linux-amd64"
      sha256 "17f82b30e2e7ff4ef7245be4f0af970582a4c9b32aee2d4224dfb325a8fb45cb"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.34.0/agent-compose-linux-arm64"
      sha256 "2930e87c688871cfdbdff971c47306c3ed7da38f48c9b80a92d19e7dd08ac896"
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
