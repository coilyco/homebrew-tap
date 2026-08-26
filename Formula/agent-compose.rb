class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.58.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.58.0/agent-compose-darwin-arm64"
      sha256 "04418f5b0e598c8529b3f915a1b2a6e17dce09c4663edcedf8ea6cf03e98981e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.58.0/agent-compose-linux-amd64"
      sha256 "3e913716fe88fc02d432ff5684d2afb64c77071b4c49b89da7d318ee90140765"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.58.0/agent-compose-linux-arm64"
      sha256 "9aa828ee7340bf2322a1c9ea588fc393a283a2da59248ca4887ef803abcbd8ba"
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
