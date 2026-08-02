class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.1.0/agent-compose-darwin-arm64"
      sha256 "e2b13d27e8aa30756e2346544fcb4beee20ab9650adea2483139b219c4259dcd"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.1.0/agent-compose-linux-amd64"
      sha256 "c60497fd9e476714922bf65b4bfdafd6144c453b77d6fbc7d8532096560fbe21"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.1.0/agent-compose-linux-arm64"
      sha256 "edce98c34fad83460063c30be470480cfc34c402f69c2360a81b9e485024438f"
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
