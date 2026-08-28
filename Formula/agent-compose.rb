class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.69.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.69.0/agent-compose-darwin-arm64"
      sha256 "7f1054d236f0fb03c95ec311c610be00720dacdd3a6770d23339195887e600e3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.69.0/agent-compose-linux-amd64"
      sha256 "c913cca3e84b992116a91450204f57d6718840b08f563505bf227ef6fc858156"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.69.0/agent-compose-linux-arm64"
      sha256 "6be3749e53151bc9b203213555f188121be55b6ba57954197e77d1eaf50a6e1e"
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
