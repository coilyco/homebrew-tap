class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.44.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.44.0/agent-compose-darwin-arm64"
      sha256 "3cc17fff50fb812cc12d146db6127256a966f957f9c406e658a511f23d9cc972"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.44.0/agent-compose-linux-amd64"
      sha256 "976300030f0d9b56cfd642cf0357d0293150c552384abc74885b2b89aa9838f3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.44.0/agent-compose-linux-arm64"
      sha256 "642ee553bc538ca7c0ea5309cd6c717f5471b70d57052525ce378d3322d5f77e"
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
