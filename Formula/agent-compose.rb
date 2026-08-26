class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.59.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.59.0/agent-compose-darwin-arm64"
      sha256 "cbe563a8a3bf670c7dbf0b6f94d6682f09ce4391ba3864d914f63f03aae21b13"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.59.0/agent-compose-linux-amd64"
      sha256 "ec8e6c46bf09acbc7219e56e943cb2df7f4de49bf0bc92883fb5b77c4e2569a1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.59.0/agent-compose-linux-arm64"
      sha256 "2c4ce7b0a2b25476e14dc09974c6223b49acc248f73b015e46cae46fda593534"
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
