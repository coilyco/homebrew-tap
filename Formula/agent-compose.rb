class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.70.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.70.0/agent-compose-darwin-arm64"
      sha256 "a4e42d0c57903b8d4aeda4f069c8d0ad9b848ebf8cadb4389d0d3ec46ef497e9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.70.0/agent-compose-linux-amd64"
      sha256 "0dcac16f68b03a5fd5fd936f369623e787a353433c3bbd1f88026b8f840aa70e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.70.0/agent-compose-linux-arm64"
      sha256 "21c0da59f962bc6e5b36fbbe8504d7fc4a727d143c3bcd2f03830256dc6ebee9"
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
