class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.91.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.91.0/agent-compose-roster.tar.gz"
    sha256 "a75280b28227388abbf3de8f0d43e4311de34c7700e1c7e21724339aebd77802"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.91.0/agent-compose-darwin-arm64"
      sha256 "0a5876a48f02285927d56aa998add5c8f7bb9c7cab7c66f2ca1483ccedf3d54e"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.91.0/agent-compose-linux-amd64"
      sha256 "42ce8725cab88826f1b8adee2b3e2e23274ba2e33e64bf39d7d1e989555616ac"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.91.0/agent-compose-linux-arm64"
      sha256 "e1a3e0a881d304148cd25b5b41c4e7ca567328b4d29a17e2eb17f746fe814aed"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
    resource("roster").stage do
      (share/"agent-compose").install "roster"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
