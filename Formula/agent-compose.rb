class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.19.0/agent-compose-darwin-arm64"
      sha256 "0c1b7fa3fbdf35ac3046fdeec4cd576aeaff006e0f41ee57b4344095a4bb2add"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.19.0/agent-compose-linux-amd64"
      sha256 "052d10cce3dd5991e55396dc0756f2e58d88495661ec0e6eab5674dd2c4ca468"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.19.0/agent-compose-linux-arm64"
      sha256 "d6e3aceaf116d0edfc173afac7796736c40028de0ec39f463359e2862aacf533"
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
