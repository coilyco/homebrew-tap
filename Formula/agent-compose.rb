class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.42.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.42.0/agent-compose-darwin-arm64"
      sha256 "b71cdf1e21496527672658a093244b1f206f9f86d496c14869fe9d8c678366a1"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.42.0/agent-compose-linux-amd64"
      sha256 "fb37bd365c86768495854d3a9f3903afbe07031604e1ce4931d397bc0cd4305b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.42.0/agent-compose-linux-arm64"
      sha256 "13f3d5beb4eb2082b3d89cd0d52529e8b48c7f79579e2e769ce00af7c8ead83b"
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
