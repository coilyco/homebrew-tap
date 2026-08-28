class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.71.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.71.0/agent-compose-darwin-arm64"
      sha256 "552611d9b2536c84774fae112ba938a5af15005078b52420d319b434fff4ac1d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.71.0/agent-compose-linux-amd64"
      sha256 "7c8de9b92995fe1276683985886c6d99cac330b873fc408c7d26a63e143a300c"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.71.0/agent-compose-linux-arm64"
      sha256 "c0bb072cd2125fce966fe4ee16e48c8d29ef263a9f689f1ee858a2806d6b1e3d"
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
