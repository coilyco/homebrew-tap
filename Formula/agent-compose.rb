class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.64.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.64.0/agent-compose-darwin-arm64"
      sha256 "d35183e8243c89f96348acb7c98f2c5ff3ffeb4e795fbfb7799db77d58189b3e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.64.0/agent-compose-linux-amd64"
      sha256 "8ca13c97b9da75bab216f87f58eafca78f4f7c4589da6b2a1c36192c17fe552e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.64.0/agent-compose-linux-arm64"
      sha256 "fe852c5e32c85c64600ebd596c20a5449e48eb6bdd64218df1e39f5817587bae"
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
