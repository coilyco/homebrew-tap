class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.56.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.56.0/agent-compose-darwin-arm64"
      sha256 "d90d35a0550719f145b83b3b650eea02baa382610c0176946482e3c266f1a81b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.56.0/agent-compose-linux-amd64"
      sha256 "3ae8a468d17ce88b70331c08cd0f556f4e338a6c2c6a4490b9652ef17036f757"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.56.0/agent-compose-linux-arm64"
      sha256 "ba6aa70662ea899d81cb78b113cb7913d7003c0fd2ef583f998b5b1c7106776e"
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
