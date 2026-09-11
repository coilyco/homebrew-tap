class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.117.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.117.0/agent-compose-roster.tar.gz"
    sha256 "c0563b79b865bc50e10c33ec7efec236a210d4fe9d697aff1f41cbff76037910"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.117.0/agent-compose-bundles.tar.gz"
    sha256 "53ffa5236f4500eb912ee63ebd9ea166baef89090b3fb5258c8edb2bf23072b3"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.117.0/agent-compose-darwin-arm64"
      sha256 "1a45ee0fce9c7192ab89c654176dcb6f33f3da01de1fe8a64b80c0053ba04490"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.117.0/agent-compose-linux-amd64"
      sha256 "a315b419fb5bb0b539f7593db5d03a0f3a9cf1772f11b9965e398b3c178a1d7b"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.117.0/agent-compose-linux-arm64"
      sha256 "f602a842c99edc76c07a69969c10e3481527fe04d81a9f8c698bc23d48ff5c95"
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
