class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.181.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.181.0/agent-compose-roster.tar.gz"
    sha256 "df7cb9d3f8b7e6ee72a3992c71e573d34dd4f27a063fc2ad61c4dd1ef6c49518"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.181.0/agent-compose-bundles.tar.gz"
    sha256 "c84d52b57d9c54d8303f68f5f28174bdf0eeed9913dabdbcd53f3a448c5a8cc5"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.181.0/agent-compose-darwin-arm64"
      sha256 "2d86d13888076b42792e04cdb4248ad09ea910e2c8d996f1e057fdf717c11c5a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.181.0/agent-compose-linux-amd64"
      sha256 "e229c63d7d998574ed6deb5c951ad361a45e130cc6c18a8555541d4b0da02d22"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.181.0/agent-compose-linux-arm64"
      sha256 "36140d251e8512f6de43edef10a802df8d7456c44357ad458036ede6a6b01056"
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
