class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.13.0/agent-compose-darwin-arm64"
      sha256 "90b4ea32f59786cfc00c931d2f407045f02095ec3cf78af13d37c3675ce07f5e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.13.0/agent-compose-linux-amd64"
      sha256 "fd8b439ea70c084a036d0c17c77bb8a2d8aa56e82ac1a35c86a4adafa9a56f0a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.13.0/agent-compose-linux-arm64"
      sha256 "bea801b10e280b9bc968285bd9ed8f3493fc01858f0259d31e3e00210fd5d655"
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
