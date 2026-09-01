class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.93.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.93.0/agent-compose-roster.tar.gz"
    sha256 "19c721944902fa96d44dc0149ce5e4e8d574041e6068445d923d9c21cd340372"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.93.0/agent-compose-bundles.tar.gz"
    sha256 "5286e729367c0b368d4ea268a8b90bb3b2cc61746c205a1b1cf0c034d46d71d1"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.93.0/agent-compose-darwin-arm64"
      sha256 "c8bc30284e07f178d80061310b19f771d41096028db83c8a99faae0b822cf3f9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.93.0/agent-compose-linux-amd64"
      sha256 "e5f49f0eddf499bbc10d1acc877a6deb16e3fd188606a4a905a8b7adfdc86036"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.93.0/agent-compose-linux-arm64"
      sha256 "bb4d8ec46b53d8aca7e5ca40fde67fb625d5f6996fe4a54ced92a515177e62c3"
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
