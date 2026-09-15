class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.144.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.144.0/agent-compose-roster.tar.gz"
    sha256 "d0a43e8b32ad34aeebed414b94ad6b65fddae296d304d059952c53bd10bd820a"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.144.0/agent-compose-bundles.tar.gz"
    sha256 "1c4e9ae576f964468e703cdefa38ce55231befcf4b0e37a29c81cfb6cc157ca0"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.144.0/agent-compose-darwin-arm64"
      sha256 "5f730d2b3c72e7f147ac3437034c8e8501fb740154f1302a3a8b6e2d69597c0d"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.144.0/agent-compose-linux-amd64"
      sha256 "6ed8db90607d9efe8f63cdea1373da4b23a1ce245d76902797f1758a1925973a"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.144.0/agent-compose-linux-arm64"
      sha256 "47a1e8a7cbfda8c2924241fae666f1597e2bddc0d0cc15a7b25ee0409dc0e7ce"
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
