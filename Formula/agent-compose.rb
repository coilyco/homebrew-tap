class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.15.0/agent-compose-darwin-arm64"
      sha256 "f79d4db764a41466cfd558bfc32ca6ad1ebc052ff5285438721366bedbe67c1c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.15.0/agent-compose-linux-amd64"
      sha256 "48371c406dee586ae065bade78eaaa515adad4d7f50ad966c74942e06907db40"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.15.0/agent-compose-linux-arm64"
      sha256 "716ac736222eb4255abfa27ca6d0fc85ab9906ecc05b93fcf4b16bf68ed080e1"
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
