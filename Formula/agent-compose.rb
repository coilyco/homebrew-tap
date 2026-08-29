class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.79.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.79.0/agent-compose-darwin-arm64"
      sha256 "2fcb9ff07f527af31f34c0d35abfb6726da8dc43429dd91a9463da76fd19a107"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.79.0/agent-compose-linux-amd64"
      sha256 "45d6bea45af95742631f90dd79bd5907e37ac7c2ddd2b542ed0dc50b5cc063d7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.79.0/agent-compose-linux-arm64"
      sha256 "4f37be639cd99a56589aa0e4b9751e3abab88bd85064b5deaf2082025b767003"
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
