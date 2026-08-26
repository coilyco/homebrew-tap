class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.57.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.57.0/agent-compose-darwin-arm64"
      sha256 "52805f1773a4e15db1a93ec6cec77e4d26ee0d0964fa8e837bbf15584bd9b9c3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.57.0/agent-compose-linux-amd64"
      sha256 "5b9f26bc15251fb02d95aff8a3faa3436413b03e8c27f2ddb2748edc026d9fbe"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.57.0/agent-compose-linux-arm64"
      sha256 "1b6f4904108250930d4f4e57166cd0e5b678e5a5b530550cf93d2981dd6188ba"
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
