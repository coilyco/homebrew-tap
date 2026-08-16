class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.23.0/agent-compose-darwin-arm64"
      sha256 "3677ab19710bc99f0a100091b9e5dbfab590adb44f5f572d77f5c66985802b0b"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.23.0/agent-compose-linux-amd64"
      sha256 "e4694bbfc8ca2b269f8796283c3f8bc05aa22f95237b52d0e16617056f50e940"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.23.0/agent-compose-linux-arm64"
      sha256 "b9615940d71ff22baf6219351749eb008c877e4c08c8b9ebce48276e26975a08"
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
