class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.28.0/agent-compose-darwin-arm64"
      sha256 "dca042af2b62f223673a4eb38d753f708643a39a79e649cb12d073130a4e8f18"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.28.0/agent-compose-linux-amd64"
      sha256 "a4044613e7e293b73c1dba59f2627d9b9130e8753564d50874fa9b06c73fadf8"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.28.0/agent-compose-linux-arm64"
      sha256 "52f769f36f068e2e7a2eaf3bd121e8e7ea5b0be7a05d76c6fac7bcda0d4e41a3"
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
