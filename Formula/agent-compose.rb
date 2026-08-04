class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.2.0/agent-compose-darwin-arm64"
      sha256 "851c834bc0d1e1912cfa1b8e729836bba3735fca0e05c1e899507549e136aac7"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.2.0/agent-compose-linux-amd64"
      sha256 "7a03da3da88932d1adcb6ffd3c4107f36ffd5a8ef1476a5cc69b51754fe52250"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.2.0/agent-compose-linux-arm64"
      sha256 "a81d82193d88d43da4c4ea0bd7f64d97a4249cf9348377e46d7b1d50214ad94c"
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
