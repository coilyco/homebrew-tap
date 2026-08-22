class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.39.0/agent-compose-darwin-arm64"
      sha256 "04d4de43f54038bc4068553bda6ec2ca7fe5dd9c33e99b751c16e2b4f25224e5"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.39.0/agent-compose-linux-amd64"
      sha256 "319c0b8fc74f1ad50b07893868fdb11b2ca7c6a91500b673de261d214782fde0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.39.0/agent-compose-linux-arm64"
      sha256 "99849795b8722aee7bf35fcb62b6d06223d042c88f35e8ac41212de877bbf967"
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
