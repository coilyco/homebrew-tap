class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.55.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.55.0/agent-compose-darwin-arm64"
      sha256 "9c5253c375ab812c31cf883e6af5668ab4c327859d83da773b5b4319e72e07a4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.55.0/agent-compose-linux-amd64"
      sha256 "fa2d75acf01b414fafd981d906da4cd6d2eac66397a6bc39ad27caa23d080b0e"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.55.0/agent-compose-linux-arm64"
      sha256 "05e7a0dce95c4658548004959fd0d283e3229b3b9d87369448e202050a851871"
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
