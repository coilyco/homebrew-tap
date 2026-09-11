class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.126.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.126.0/agent-compose-roster.tar.gz"
    sha256 "522dcd8714903667dfd9c01a856e867d52d57fd78c002ed709d341c1bf0c295e"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.126.0/agent-compose-bundles.tar.gz"
    sha256 "9ad972a8b90274eafd4a5228bb7ba38fb09f8d946f188bba54336b5249457c79"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.126.0/agent-compose-darwin-arm64"
      sha256 "eefc534f4faa30911f3f3bc21db62a60979c8749a21f941ac7dacede5fc0f74a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.126.0/agent-compose-linux-amd64"
      sha256 "9ef116eaa39343eb537a591223d51c974a1b7571caa128b11b53ecc2c4463653"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.126.0/agent-compose-linux-arm64"
      sha256 "ac48214f0789a321abed1ea0c37978f7f7ef11ff25549b8078ebac813dd6f5a0"
    end
  end

  def install
    bin.install Dir["agent-compose-*"].first => "agent-compose"
    bin.install_symlink "agent-compose" => "acompose"
    # Homebrew chdirs into a lone top-level directory before yielding a stage
    # block, so a block cannot name the directory it sits inside: agentic-os#6835.
    resource("roster").stage(share/"agent-compose"/"roster")
    resource("bundles").stage(share/"agent-compose"/"bundles")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-compose version")
  end
end
