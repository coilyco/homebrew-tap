class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.4.0/agent-compose-darwin-arm64"
      sha256 "6bc78241eab397ced6a182d0e184cffa9068abc15a4169140a1334f3191bf0b6"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.4.0/agent-compose-linux-amd64"
      sha256 "d2bbdf50951a216e2ab2542aac63304aadebc458184ef960dc1cd253b5af0b7f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.4.0/agent-compose-linux-arm64"
      sha256 "4564160af2a6a0168e833038ff99b2506c5eed49e9a9bd5520863cea256b8f47"
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
