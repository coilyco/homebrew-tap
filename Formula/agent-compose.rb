class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.21.0/agent-compose-darwin-arm64"
      sha256 "c8bdf71e714331e13fb5a17ba7b8464cd1e4b24b9a9b2019f975d7f399741e81"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.21.0/agent-compose-linux-amd64"
      sha256 "643a08ceee76517eede65ea8f2917a2d1f91dc40c6d93cf1ad14649e088615f2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.21.0/agent-compose-linux-arm64"
      sha256 "30155e7acb74885d3d7b2db638a6841232bc9c587b8c5fc4b44e3af6cd55ad0b"
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
