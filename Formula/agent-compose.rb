class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.51.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.51.0/agent-compose-darwin-arm64"
      sha256 "f259ed2e066aadab3aeb72dec90506106bd9ee969632e5a1d0ec9b4ea848c051"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.51.0/agent-compose-linux-amd64"
      sha256 "60c1bb759ac2b39e77bd5a67646c86c629dc719d7a7aed26354d71fb7b24bc26"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.51.0/agent-compose-linux-arm64"
      sha256 "597e54d1bb44d7faf32eef7d7aebe4d9a620e1451c3841ac6ae79c6a61b8839a"
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
