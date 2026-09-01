class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.84.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.84.0/agent-compose-darwin-arm64"
      sha256 "650ab15b6666c14dd4102a8e38f44588f89d17a3160a34258935fb9bba8679e4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.84.0/agent-compose-linux-amd64"
      sha256 "fc661212df2348543a3ebdce088e2636e793ad7134ee415523b58d0c446db5c2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.84.0/agent-compose-linux-arm64"
      sha256 "cc421adc3d27c6b427c74b42569fe11a2fcc0f85a6cac1ee2b303eb0aafd5565"
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
