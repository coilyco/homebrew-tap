class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.67.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.67.0/agent-compose-darwin-arm64"
      sha256 "f0a0c4f9c8483d9774b4a4115b422af185cf2c3a87651eaca7861665959280f8"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.67.0/agent-compose-linux-amd64"
      sha256 "ae985559b92496eb05edf70c14266280039fa522e0814ae3680601276c2ccd4c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.67.0/agent-compose-linux-arm64"
      sha256 "08a54a632036d22364572ffbf825e29d84cd576d2d776734f752956a82e004fa"
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
