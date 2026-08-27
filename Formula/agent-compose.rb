class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.65.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.65.0/agent-compose-darwin-arm64"
      sha256 "9f97b7feb5fe1750034b6456014dae390d99f37e67fe9c212d9a4ef632c1b749"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.65.0/agent-compose-linux-amd64"
      sha256 "8fd2e05a188f50a33569b4e589a3ae7feb7a9fe2fb26332817e34b1110f51782"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.65.0/agent-compose-linux-arm64"
      sha256 "0d4698c28e63fcef00108d3f9e126c92fddf4a55547b40ec6ee9d02e5888c2e7"
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
