class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.173.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.173.0/agent-compose-roster.tar.gz"
    sha256 "7d4d3ae5cd2837d6ae99a2d9245d9cb1dad79faf504f31c398d1f7d99cc41d6c"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.173.0/agent-compose-bundles.tar.gz"
    sha256 "fdcf53d29c646ab35a74a55df5921a43cfa8695d30b0e9afc5876bf266adfd0b"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.173.0/agent-compose-darwin-arm64"
      sha256 "52228d7a6ff094e3951f966173d5ec3a528c00b063c162b6a10460ad9ca8af77"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.173.0/agent-compose-linux-amd64"
      sha256 "52a883266e415235ac6b665d64ac925a017fd4c8e897e4994222a3882b9a3b8d"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.173.0/agent-compose-linux-arm64"
      sha256 "d025d52a430dfe68fca9cffd8339dc57b6018f9817b4fea8600e7f3104a171d1"
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
