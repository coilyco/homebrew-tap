class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.9.0/agent-compose-darwin-arm64"
      sha256 "1a62a885ea40285839b33912d0993d7beac9a05c5c510967e084e2103d744fb4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.9.0/agent-compose-linux-amd64"
      sha256 "fb531db1901ac11fb443bc1a1ea0d56a5482590f7841e459cee70e65141a3642"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.9.0/agent-compose-linux-arm64"
      sha256 "8b43baf87aeab36698f940b1ff3629f5b6f970912e46a88cd41a04297aae4ea1"
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
