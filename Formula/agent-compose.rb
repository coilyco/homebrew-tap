class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.75.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.75.0/agent-compose-darwin-arm64"
      sha256 "2b75c123c48be3a896bbe3a7c03446359e019a6ccf80495c411fe1cf52ecdcc0"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.75.0/agent-compose-linux-amd64"
      sha256 "242d984d0259b58fb7a23c6e923b199b51d6d3b0b1822aa0e4fad57f9e16dfb6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.75.0/agent-compose-linux-arm64"
      sha256 "184ce79e35a51a234d920465977b7fb52b69e3e107aae29f7e00ca484050067c"
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
