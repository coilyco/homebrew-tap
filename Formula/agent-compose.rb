class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.86.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.86.0/agent-compose-darwin-arm64"
      sha256 "c00e2d2b749195bf5de768f1513fdf4e94cd85c1427b12767c71d3e95fd6f768"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.86.0/agent-compose-linux-amd64"
      sha256 "412a3eda7db83f788008d3675df1303d4534147fba5ab698b0662474d9498bdf"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.86.0/agent-compose-linux-arm64"
      sha256 "08c3668e10e0d67d2358229a0a513436688731b9cda07f08a1c3b751d143a248"
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
