class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.92.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.92.0/agent-compose-roster.tar.gz"
    sha256 "cd342d19aefd26871be12201e2cf5ba10c852b63530e590c9064e3d5baa36c55"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.92.0/agent-compose-darwin-arm64"
      sha256 "2bf2d86211bba3cb610d263dd385e250ad618410cdfaafa86feee9b4072f24cc"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.92.0/agent-compose-linux-amd64"
      sha256 "21420063a3b0129f486bb7b26c0e40e8f0c48d1bac2f191980ea87a17893d561"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.92.0/agent-compose-linux-arm64"
      sha256 "f160b5d98c26f388b63268ae26162b4c3408080dda1caa19c9e6b8eae014dc09"
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
