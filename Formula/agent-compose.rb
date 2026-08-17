class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.26.0/agent-compose-darwin-arm64"
      sha256 "d248ffc66984cee36bae85a44855eb53bbc6dda2fe8212deb1d00e067a0dd957"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.26.0/agent-compose-linux-amd64"
      sha256 "cab74f12b38a9facc65bb2af386bba939c3648273777434fab3e9676f8b0597f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.26.0/agent-compose-linux-arm64"
      sha256 "b6bbf2554cf1791e051bf3600c30cdb0434ffb36f24aab4161cfee0f3842d1f9"
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
