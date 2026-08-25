class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.50.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.50.0/agent-compose-darwin-arm64"
      sha256 "01fd14271d61ffa2cfede0316f74f454d86024c76d3f2358b48e5de99a1bf1fd"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.50.0/agent-compose-linux-amd64"
      sha256 "73318f08d9c07b0f7298874b55a0cc2e006459ce87dd9da2a3b613161d423203"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.50.0/agent-compose-linux-arm64"
      sha256 "f64b105ef451fee70079fd90198bd197fc03a84cddc461a285efe140da545ad9"
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
