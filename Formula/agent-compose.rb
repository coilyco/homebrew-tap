class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.12.0/agent-compose-darwin-arm64"
      sha256 "10c3216c75480ae0445e781781d52ff4e05a2c04faf400878de1d34942dbafd7"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.12.0/agent-compose-linux-amd64"
      sha256 "de3bbef2cbf8ed77b08e1ab3bc29fe4e1d7d703991341431bf80a93aee27e98e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.12.0/agent-compose-linux-arm64"
      sha256 "8cbde9c96fecb3499bbde2f762281278dd293c074d11e3cfb68823c7d939de8b"
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
