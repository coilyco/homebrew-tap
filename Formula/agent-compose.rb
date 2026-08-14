class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.20.0/agent-compose-darwin-arm64"
      sha256 "bfc08795bd4d62ef2f22e23fe2cc9405a8c33daa5d6104fbaa0a12d2618a962e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.20.0/agent-compose-linux-amd64"
      sha256 "905b4eaace0fcf1fd445f300e4a33d330b1220633ea03ff6f038765021c8a9a4"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.20.0/agent-compose-linux-arm64"
      sha256 "3fcd2b01ecdcbe50ddaaa0aced1857286163b20df7cbd7cefd9b6ff8a6b26cce"
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
