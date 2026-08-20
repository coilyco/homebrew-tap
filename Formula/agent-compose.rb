class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.38.0/agent-compose-darwin-arm64"
      sha256 "c7c4c30a1f329a85ba590f5e66c4da2c7475dec68650f082356783c2234f0c75"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.38.0/agent-compose-linux-amd64"
      sha256 "8911b8f3f335ccda4a1b8b2bc1b108d1b0f3f46ce0c323e7294085a9c1dfd3b5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.38.0/agent-compose-linux-arm64"
      sha256 "6dd294c1f5a26fcf3432431df796f4bb1fefda49c61d6044cee4789feeabc567"
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
