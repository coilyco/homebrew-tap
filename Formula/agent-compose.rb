class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.35.0/agent-compose-darwin-arm64"
      sha256 "44446388cd6fc1d5a86bd71cdc1110dfbaef1d996caecc5edd19f18541ffa475"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.35.0/agent-compose-linux-amd64"
      sha256 "4233dfbab6f5e43d1b6f6156d255ad3199efd953980c9968c646ccfb69f181c3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.35.0/agent-compose-linux-arm64"
      sha256 "9220bb88fafb8758e4015c8fd7e3ca7f5babe82c0ae3e8c2315a339aa5f8740b"
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
