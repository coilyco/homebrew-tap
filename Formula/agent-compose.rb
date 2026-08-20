class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.36.0/agent-compose-darwin-arm64"
      sha256 "5a5eddffd1799955d93abb9ed64c88050f5f6b4aca3f8ac976fddae5a22a00a6"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.36.0/agent-compose-linux-amd64"
      sha256 "84c5ccc2086b7a7aab4d079309a5211cbb68321b8ca04a5959bb5672d0ec0f1f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.36.0/agent-compose-linux-arm64"
      sha256 "4bae871a9b70500ae19b2272795f94e57f0edf2b7c0e8a3531a5b2699cbb274c"
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
