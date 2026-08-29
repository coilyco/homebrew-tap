class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.80.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.80.0/agent-compose-darwin-arm64"
      sha256 "342613a148d6ee394c51cd02fc7136b969d7c9cf0ad11e14d4ef2c35ddeeddb2"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.80.0/agent-compose-linux-amd64"
      sha256 "58c06ec8d580786298502451bb3a9c3dd0c101dc11ace6a77cb590bf18016df3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.80.0/agent-compose-linux-arm64"
      sha256 "005c46190c3cbc208d53fb0484d6037bf2c54a4b7e4c6ef437683078eb28f37d"
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
