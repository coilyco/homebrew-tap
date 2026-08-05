class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.6.0/agent-compose-darwin-arm64"
      sha256 "d7729db0e3cf49606b2348204f94c197c05b0a451c22df3bc7d3493dd851b59f"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.6.0/agent-compose-linux-amd64"
      sha256 "307248317ee13ed8bc3bc32f2068702f2a12083b032a482f506f63cf3222bebf"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.6.0/agent-compose-linux-arm64"
      sha256 "a4228da9339ebc4d6d93ec90a23fdb1ddf82cf4ebb86a9f058148080241b1e96"
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
