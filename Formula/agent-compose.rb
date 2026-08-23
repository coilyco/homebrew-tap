class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.40.0/agent-compose-darwin-arm64"
      sha256 "e2ba6beae23df1cf4ebdcdd552f4c6da2d9c409d4bc9f24da655c00fac5a6fee"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.40.0/agent-compose-linux-amd64"
      sha256 "c8e74ef462cd982994c4cad24b7197f1d400b624190ccdf904ad2b21788e1847"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.40.0/agent-compose-linux-arm64"
      sha256 "d1655888541d709f4bd88092e57e18e99b40e111d801ca66904b4fcc3613e41b"
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
