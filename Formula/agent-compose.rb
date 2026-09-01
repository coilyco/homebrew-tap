class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.88.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.88.0/agent-compose-darwin-arm64"
      sha256 "e98857f32edc6ec37fba9735d91687cc85a5c4ec56f5b3d2b858ec91b7e887ad"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.88.0/agent-compose-linux-amd64"
      sha256 "b5fd7af93945ba439bdf870e31fbe14a51f3e141604980d3fd48cfdf0ed928f9"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.88.0/agent-compose-linux-arm64"
      sha256 "11fdd036e7d25d12ea6e4217c8988a4e5d65dc1b407fdb1b0ba8f448965d4965"
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
