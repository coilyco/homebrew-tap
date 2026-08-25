class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.46.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.46.0/agent-compose-darwin-arm64"
      sha256 "1f79ac5e46ad617cfe32db26293ef9b055aa575e74e2a93d9106f7f5a1235104"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.46.0/agent-compose-linux-amd64"
      sha256 "45450a34a9a0f7941cb9dde42b905839cfd0a2839d179d5bafcacca0013dd271"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.46.0/agent-compose-linux-arm64"
      sha256 "a5aab2d9b80b14975009b98bcac9b0ca05c598a17d85e26ecc09ad4ea8106b83"
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
