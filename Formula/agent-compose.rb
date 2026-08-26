class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.53.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.53.0/agent-compose-darwin-arm64"
      sha256 "1ac5b4b347d4cd12257c8ac0c73430bc87e1c933bbd6eadd40ea04c7f9d54596"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.53.0/agent-compose-linux-amd64"
      sha256 "94ef1c823ace5a3650c7b8293305fcb98a2fde776a05438b08eacdf51fbb5fbd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.53.0/agent-compose-linux-arm64"
      sha256 "548a717af758767b82103d6ed2327b34f0b57a9fab3924098572c4cdfb35f1b4"
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
