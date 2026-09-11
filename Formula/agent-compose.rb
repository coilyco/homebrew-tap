class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.124.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.124.0/agent-compose-roster.tar.gz"
    sha256 "d5a5dabbc599d9952f1c081ced48c970ca6430b27dd5326ee8c7904ad33e18b3"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.124.0/agent-compose-bundles.tar.gz"
    sha256 "24f90503b279f919e2ef9e3526137d3f01f5f5bdd1c039e73b7305e37e151091"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.124.0/agent-compose-darwin-arm64"
      sha256 "2b02a098388da82018073305835eec4c7c1f4f65f6cf714f9b643673b1acccf3"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.124.0/agent-compose-linux-amd64"
      sha256 "18d2e3fcdd12658cfbdf5f75c17fd7d82526257b1cdc4745eb52fe4ca3c9e91f"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.124.0/agent-compose-linux-arm64"
      sha256 "a7443b3a666f60f3d1f6e38c1268e9983e80873bf88d4b65549fbf86f82bbd4e"
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
