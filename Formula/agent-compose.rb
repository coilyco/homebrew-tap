class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.85.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.85.0/agent-compose-darwin-arm64"
      sha256 "8ac6b21e251ce2bda92ea7f60dcf1fbbb171b4ab092bd451f775c6f6e36d0d77"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.85.0/agent-compose-linux-amd64"
      sha256 "1065e2ba4a38fab8eb10124a4136deec8435e670fb5aa5156fd7e54923194307"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.85.0/agent-compose-linux-arm64"
      sha256 "478bacd5bd83ae529da8ddcfaf527dd18a1ed42a1f5f90514bff6f117affa339"
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
