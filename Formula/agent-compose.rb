class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.97.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.97.0/agent-compose-roster.tar.gz"
    sha256 "ccadc28e8014ec1201ce09e8afe33e56afe844e9982ec62da75504b433b2936c"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.97.0/agent-compose-bundles.tar.gz"
    sha256 "6db23d3fdd8cdbdc93f1633d4de39da1fc338df9f154853497ba8133502680e3"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.97.0/agent-compose-darwin-arm64"
      sha256 "acf7cfcddbd97b68b67907cb4c73a42142df207249c8364f342d658c41051cf9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.97.0/agent-compose-linux-amd64"
      sha256 "28c5d5789dc564d4c1160e0c08c39048888450ea6dc37df1e4c68bfe65ae78d2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.97.0/agent-compose-linux-arm64"
      sha256 "5ab2ad8d250fb4b0c371743ccd5bef9c00c891a3d05518e82cbe69e9607c1e93"
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
