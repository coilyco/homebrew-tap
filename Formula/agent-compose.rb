class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.63.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.63.0/agent-compose-darwin-arm64"
      sha256 "c0fe681d06708dfa969e38a976a89bbb8f65d7bf48ff6fb5b53d9dac9e8fc00d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.63.0/agent-compose-linux-amd64"
      sha256 "ea60cff237349b565b58a12b7338440135d2c7d9263d6502ccd194f720b77e1f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.63.0/agent-compose-linux-arm64"
      sha256 "da00b25e0b97ed6d4ea3eb0c49c6becc14a6e20c2783b3eac15baa1fd4444151"
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
