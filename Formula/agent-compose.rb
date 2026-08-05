class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.5.0/agent-compose-darwin-arm64"
      sha256 "38452ca41f23fa588c6370e42353c81f3033589a162b5588a3f87d9c41bb8754"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.5.0/agent-compose-linux-amd64"
      sha256 "a648812a5ee5efd7eefc5bfe900132b18b7ecb423f6af4938ee92a1e0a792411"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.5.0/agent-compose-linux-arm64"
      sha256 "d9ad8ba0ac7ab38839d13c827317ec4b2b840c36fd0c5a38f4e04fb5e02d0642"
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
