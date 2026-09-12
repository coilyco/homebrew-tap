class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.133.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.133.0/agent-compose-roster.tar.gz"
    sha256 "1646607436038cbe6b597648a0ef70bbd3441d6a0a70e4e1fb35f436f2b1bac6"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.133.0/agent-compose-bundles.tar.gz"
    sha256 "f0be922613e81558187216f8898da458f17e44eb235963c7d8392c26bf410be2"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.133.0/agent-compose-darwin-arm64"
      sha256 "ade63330542da64ce76449e42f59821c755e4238abeaf843c187784f1249aea0"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.133.0/agent-compose-linux-amd64"
      sha256 "3b73745c861376dfa956c57947585e00822eb2e3eacd303ad7414857a62411f5"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.133.0/agent-compose-linux-arm64"
      sha256 "9ad5f2bda8d48af4ce48a929c0c5a0fa5496e54af1024892e5db0f80f4f33ff0"
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
