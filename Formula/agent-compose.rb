class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.54.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.54.0/agent-compose-darwin-arm64"
      sha256 "90f0bf2f67cb3703b1f0bfad64fba018d7efb669172e15019f8b589c55a1c300"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.54.0/agent-compose-linux-amd64"
      sha256 "a3071d5cf52252643850448da38e19c98f1ae17f597167cdee546a72dcc70d3e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.54.0/agent-compose-linux-arm64"
      sha256 "85249f5989ad7322456a6faf7203946985593c2c7896d96edd7b7f871aa0d7a5"
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
