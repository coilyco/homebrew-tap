class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.190.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.190.0/agent-compose-roster.tar.gz"
    sha256 "14196865bbd7b32c16e2a246d3bf0e19f08644896e4bbbcad861fe012a699481"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.190.0/agent-compose-bundles.tar.gz"
    sha256 "2d6d1a3b6c70a50ebb0aa6cd67c53e698a825a1b2752e7ce5a21dc90512a71a2"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.190.0/agent-compose-darwin-arm64"
      sha256 "ceb7a2a054f08d193513922a989eb7b8e60e02700ec6800aba6ab6153f5e355a"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.190.0/agent-compose-linux-amd64"
      sha256 "8edd3feb3d12aa0a9afafa96fb5d9ed5203768fee698b859bbafbe885df29f87"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.190.0/agent-compose-linux-arm64"
      sha256 "954d41eaa506fce7f26ee51820201ae02a01bb08307d5e8ca710ae41c65c7807"
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
