class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.158.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.158.0/agent-compose-roster.tar.gz"
    sha256 "e2015ad0a2a4c26b4185d308f47468f7ac079bd41a4546698d41848e69cdfeb7"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.158.0/agent-compose-bundles.tar.gz"
    sha256 "57aadf6350eab59b0faf4e263d75c580cb4bf8eaaed59cafedb922d140cac26a"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.158.0/agent-compose-darwin-arm64"
      sha256 "2f27565b933ee2fea5e82325095c1cd70831c52afb62e5a7ae79ba76246513f4"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.158.0/agent-compose-linux-amd64"
      sha256 "80bc87845b144fe58e05baefb04eb0f99e7d39d50bfaf8c876c50dddc2e853d5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.158.0/agent-compose-linux-arm64"
      sha256 "ac0216bdd209620100625d2462c3c65a40a48e652850ffa895a4a64592d71075"
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
