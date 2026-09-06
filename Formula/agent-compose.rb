class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.101.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.101.0/agent-compose-roster.tar.gz"
    sha256 "96e26ce80aeaaeec91aa4f341d495ccf93051058e4d0aeb0a0836849a25f8e7d"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.101.0/agent-compose-bundles.tar.gz"
    sha256 "56cfd3919952e2a977e37ee65fe7800bd7e8d6209321528025f9e79a009ae63e"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.101.0/agent-compose-darwin-arm64"
      sha256 "b521f63139261ac73d6206e4d525f52609a5251680cb3283debc1834929363ad"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.101.0/agent-compose-linux-amd64"
      sha256 "650200f43916889f91d2f734f9f87cecf4551e0c12426a31f237b172c1b6566f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.101.0/agent-compose-linux-arm64"
      sha256 "890e24cc903277c284bce69d2a136a5eca022c791356160340b1f84c9672002c"
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
