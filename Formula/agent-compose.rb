class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.45.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.45.0/agent-compose-darwin-arm64"
      sha256 "ac093b0cff80eb66a6a2e20021000c9f0886e4aa0e377725fecfb6dfcd683830"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.45.0/agent-compose-linux-amd64"
      sha256 "f4dbd3a35a8a827509b86b5dbfea900e77eb57e1d2991b5abb4a4039989f5d72"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.45.0/agent-compose-linux-arm64"
      sha256 "a9b1116872ec2ca22d437d044786a1185a27cc1021f8d7020829ac7836b58d7b"
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
