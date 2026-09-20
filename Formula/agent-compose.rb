class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.154.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.154.0/agent-compose-roster.tar.gz"
    sha256 "3858998cdef058df674027fb6f99ad31841de7eb10fe247a7d925c4cb0bbb840"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.154.0/agent-compose-bundles.tar.gz"
    sha256 "f94412da38f304d69cb2c87f93049d26dd135701b2e98f799865fc5ee2e2ce37"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.154.0/agent-compose-darwin-arm64"
      sha256 "d781a5663d49939390c7aa2980ce575b0257269a09aa876dfb2f73710496a381"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.154.0/agent-compose-linux-amd64"
      sha256 "ddf04da797c52be94a6c848f65819d1835dca98bad4a9bfbc6ce482558822bc0"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.154.0/agent-compose-linux-arm64"
      sha256 "98bd80f02dea9bde6e4071217d86a54519ec5407444887170561926a5d3a7c57"
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
