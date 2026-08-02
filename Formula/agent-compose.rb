class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.0.0/agent-compose-darwin-arm64"
      sha256 "1633e6f12c3a1a365ae84e1aa3dd78df457ec18d2e2881e3514b7b65daaec35e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.0.0/agent-compose-linux-amd64"
      sha256 "8f9331b00daf3a1f171c41e836f6d83456665f194d94cb01a40191b985028bac"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.0.0/agent-compose-linux-arm64"
      sha256 "41f4f09ba53219aab965547ba4b53343d844318af2ce39481b9e6cffa097f1da"
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
