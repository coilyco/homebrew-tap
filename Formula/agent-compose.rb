class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.31.0/agent-compose-darwin-arm64"
      sha256 "b981cbfed79c922db4f73d3b3bc06582616fd4ce32c242014e3097754628dd53"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.31.0/agent-compose-linux-amd64"
      sha256 "fc6b76a180c7a591869d707730e589bab2f5ca63604902c85ed6aa29389e3934"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.31.0/agent-compose-linux-arm64"
      sha256 "661f202974049ed69c907c62f66e835683b16cbe45737fc74c35baa5661aa618"
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
