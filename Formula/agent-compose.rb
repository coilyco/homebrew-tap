class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.89.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.89.0/agent-compose-darwin-arm64"
      sha256 "a3fbe0d47b7a4cb0cf903225c7e5561ec8593008ce7fe10bba20e8dcaba7f130"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.89.0/agent-compose-linux-amd64"
      sha256 "9926e17a5ee5f89ea00c767a1c72796cad0706f28146e36571a28311a35ecf43"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.89.0/agent-compose-linux-arm64"
      sha256 "d15ad75dd30a34443a56b9a394b240efd55416256a68ac68b45775deceb5d5dd"
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
