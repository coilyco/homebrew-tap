class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.81.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.81.0/agent-compose-darwin-arm64"
      sha256 "88b56a465f7d446db5ad0e97548a49815da261a0b1ccf8c5108f37c2c105104f"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.81.0/agent-compose-linux-amd64"
      sha256 "dc7e7d49ce9224997c8cb507aca29dc9378c74f889c5d2102c0b09023abf0ca3"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.81.0/agent-compose-linux-arm64"
      sha256 "261a493b52280c6487cc576fcf58116829da8b7e138db966c728c5b80f8a1bf1"
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
