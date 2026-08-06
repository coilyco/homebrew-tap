class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.16.0/agent-compose-darwin-arm64"
      sha256 "c2e80055c3df3f3fc5641951f7e1c4cfca92eb6965214fbdb244831503064a45"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.16.0/agent-compose-linux-amd64"
      sha256 "b9b4341d20784ac218ed39ee57dea2bfe39ba5f4889fb07ceb50e178027cb22c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.16.0/agent-compose-linux-arm64"
      sha256 "64ba5d2319465b0d2221644a5ef9c0d6333858527abc7a4a6a967247d02622ca"
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
