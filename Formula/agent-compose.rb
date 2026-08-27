class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.62.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.62.0/agent-compose-darwin-arm64"
      sha256 "181ed1fe14ae3ff222062da48ced779c54d1bb3b40aa4ff094a755665f3470d3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.62.0/agent-compose-linux-amd64"
      sha256 "a8d94028d44d35e57a15fc0f41e4a87eec53217e6ed5869ca275eeb9d2d6e0a0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.62.0/agent-compose-linux-arm64"
      sha256 "8abe3e867d3488e47dc54447a71ae672edaf1abe14a65a5b3b4c696dbb2f04f2"
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
