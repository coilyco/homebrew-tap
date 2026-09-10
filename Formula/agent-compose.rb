class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.112.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.112.0/agent-compose-roster.tar.gz"
    sha256 "67b941f3cfe999894bf2371ff75daa164131ecfff5c37e2354953566fea723b5"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.112.0/agent-compose-bundles.tar.gz"
    sha256 "e360f67657c3815885ba5e3dafc4b46290919102c7aed144740ea1ad9e3b6ffc"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.112.0/agent-compose-darwin-arm64"
      sha256 "653507953b6deaba14f09a4fa5fc8dc96c3f6374d5a72aaf1eb6a515474b6441"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.112.0/agent-compose-linux-amd64"
      sha256 "d531323ac1f37fec57b391023d40765b7650dc01536c0a2fc05de2ba13cf17cd"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.112.0/agent-compose-linux-arm64"
      sha256 "a4c2becb231873e2a43cccce1627fdf850e464972d17368be33563cfee06d5c1"
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
