class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.30.0/agent-compose-darwin-arm64"
      sha256 "756f5e0d96d1fe4ca9ac4f3ae654abd19d6ca909b7a5573450abb05cb91273d3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.30.0/agent-compose-linux-amd64"
      sha256 "d924c644750a3547308ea0f30d237c8db89cc03915fabc44b4f7454d5a817bf5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.30.0/agent-compose-linux-arm64"
      sha256 "cd289a66f0366fee86ae32a5d95d1313172e9835b425db7da13e4a1b11c8a651"
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
