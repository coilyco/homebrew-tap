class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.68.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.68.0/agent-compose-darwin-arm64"
      sha256 "b13827a6a64f8e3713f4177057a29c3f8e87503d2bfe206824ee6e7c2d3e1219"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.68.0/agent-compose-linux-amd64"
      sha256 "9e571f8060ba81ed863f90d05b9b0b68d3f40349f2997e07fd7516f1f29bb4e3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.68.0/agent-compose-linux-arm64"
      sha256 "bdbf2182d2910a08b58dfa52775006f5303bfedcd33402dcb71d873fea90d3fb"
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
