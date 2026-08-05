class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.3.0/agent-compose-darwin-arm64"
      sha256 "4d4bcd58acc191c6ca8510be79e8d89b189f3fc60cb2d4998b54c7f80ffaae50"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.3.0/agent-compose-linux-amd64"
      sha256 "1990f211430165275b5fcfedded7558859583b72ffdcd1827be82408b8ea8367"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.3.0/agent-compose-linux-arm64"
      sha256 "67c2ce80a534603ea568ba03271b657301061a677b9cc526e96af85cdaea24d4"
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
