class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.14.0/agent-compose-darwin-arm64"
      sha256 "7f5da06d635fcc51ba4b9dbafe572c9d587a8bd300ddd3f81f40ab33c41f4106"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.14.0/agent-compose-linux-amd64"
      sha256 "8385f7163ffa0f13d10d8aef2a671692f92037b5b359b90f19ad3daa00bd63a6"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.14.0/agent-compose-linux-arm64"
      sha256 "45f80f6a8515e41a3645f49f0a14140a514b4fa3f4118a26fef2df328b50477a"
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
