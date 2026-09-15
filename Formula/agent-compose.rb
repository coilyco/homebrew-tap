class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.143.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.143.0/agent-compose-roster.tar.gz"
    sha256 "1f2894a8c154bb02081dda16cfa619819207987bdd03d673d8585125aa959f88"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.143.0/agent-compose-bundles.tar.gz"
    sha256 "6027863597c6a8547ef39842370c52f4b71be304016f1d330c6b6ac05f023548"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.143.0/agent-compose-darwin-arm64"
      sha256 "273a961840378d0de0443cd63783781078a151a140ce89ff360ca4843f87c33c"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.143.0/agent-compose-linux-amd64"
      sha256 "45e9cf9099b8342f4da4b07208b446bf6086eb69377fae93ba806bafc0ba0b93"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.143.0/agent-compose-linux-arm64"
      sha256 "542819224ae199e7468bec359b12efc398fb4a32cfc133b5315ba3cc6ec3bd9c"
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
