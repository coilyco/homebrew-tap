class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.18.0/agent-compose-darwin-arm64"
      sha256 "90729ff63376c814e9d48a0d91a5c3a5583029d6a82cff14cd6093cfbf190d7e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.18.0/agent-compose-linux-amd64"
      sha256 "43908c326aa8485548f2acd97f352ec71e1588db4a95b638ff085a377666505a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.18.0/agent-compose-linux-arm64"
      sha256 "8165b5f0219c48e33582238bd1a88b6ce966846294193299559b539f10bce6ec"
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
