class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.94.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.94.0/agent-compose-roster.tar.gz"
    sha256 "e5ae99899d8815657100d35c02a526f5485bd6c88700d0685ecd09ce3e2dfdc9"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.94.0/agent-compose-bundles.tar.gz"
    sha256 "b8a7ac8cf4bc0fe0f92dd6bee3f0562dcc91a9eec5fe3bb8228e1634bb0f56cc"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.94.0/agent-compose-darwin-arm64"
      sha256 "f2eba9cfd10d27a56a5bdaca7d75a10ecd58d47ca3ba6699fb60ffdcaec371f8"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.94.0/agent-compose-linux-amd64"
      sha256 "5847ef36dcf084a6ff4861c4d977bc2db2f56544f303036f9d7809f4e56b7dc7"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.94.0/agent-compose-linux-arm64"
      sha256 "0df4c3c60cf49b220593d470eb451c9ec27ac6dc2ca45f9f20fcf34babeed925"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
    resource("roster").stage do
      (share/"agent-compose").install "roster"
    end
    resource("bundles").stage do
      (share/"agent-compose").install "bundles"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
