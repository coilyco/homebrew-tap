class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.66.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.66.0/agent-compose-darwin-arm64"
      sha256 "5069d5c0957569c7e98789f9c75b0c4cd583c3fd207a2d4809eaa4bfe3c71cc1"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.66.0/agent-compose-linux-amd64"
      sha256 "ca0e96ca6f615c965fafb85f963ecd1bd85a2c3afb96e86fd5b395c731f49c56"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.66.0/agent-compose-linux-arm64"
      sha256 "20edfd5d979d9f82204d295fcbda5a9903f009a0c9ea958d5b0a8bdc0be04af8"
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
