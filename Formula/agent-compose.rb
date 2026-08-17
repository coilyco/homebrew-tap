class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.25.0/agent-compose-darwin-arm64"
      sha256 "b673369b659a5a6b047ddf30f4182bea50bf0fad661967b3fb735a18206f7847"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.25.0/agent-compose-linux-amd64"
      sha256 "7d505cd5cf2e131eaf7f77e83eaec3a726de262adb38d841969a7316fdd94db2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.25.0/agent-compose-linux-arm64"
      sha256 "eddaa9518dc3f146212a0bbd4d7de8f944580d0c256c3bc46696e98187d55204"
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
