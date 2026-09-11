class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.119.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.119.0/agent-compose-roster.tar.gz"
    sha256 "36bbb21fe84058ef769b3fe2cffcf09dedba35295a3118e5d31f526ff105f964"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.119.0/agent-compose-bundles.tar.gz"
    sha256 "8bda57683a79ecafbbfac7abef430cfee6f2370a61352a2727af2408926cb7d9"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.119.0/agent-compose-darwin-arm64"
      sha256 "ef5d9606dfa635bf103c9615e0c834c273a3ca8814fe2181346869e8913d4100"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.119.0/agent-compose-linux-amd64"
      sha256 "6edfcc1e305587247aa548cb425080812d27a00fd1be9e26d05bbfe698fb9a11"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.119.0/agent-compose-linux-arm64"
      sha256 "98a7c6bc1b828fbce3573c3e1c810409cd1ed669a931dc4c1a8291d64ed16bac"
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
