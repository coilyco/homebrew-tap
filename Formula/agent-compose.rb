class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.99.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.99.0/agent-compose-roster.tar.gz"
    sha256 "949f7f5f36527d8fa27c783c81b2e07eb43d903c2f9daf06436bdab514065427"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.99.0/agent-compose-bundles.tar.gz"
    sha256 "f0d09ec1562af4f8ac6752a56bab6d47a47ba4b23d467a71f847b11f310e05dd"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.99.0/agent-compose-darwin-arm64"
      sha256 "64ac55a4e6e281cf864e464ac4fa01c05224d87d46dd6a69afdbfc483310e5eb"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.99.0/agent-compose-linux-amd64"
      sha256 "d49764413252fcd47426d492b8c55f4fe76123fd8a0493fa2acc874456740fe1"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.99.0/agent-compose-linux-arm64"
      sha256 "7dd6fa27235c56497f4cc31cccb1f6bca3dd254885a7194c30f5a7145d660585"
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
