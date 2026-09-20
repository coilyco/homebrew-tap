class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.156.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.156.0/agent-compose-roster.tar.gz"
    sha256 "4380bf9d0769f7f37a008c23c335384759662dc254c876162c2f0eacebb2e1d7"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.156.0/agent-compose-bundles.tar.gz"
    sha256 "1613884a11ed150a341142d7139241a8563e524786f1383a4703f80517954538"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.156.0/agent-compose-darwin-arm64"
      sha256 "3bc4a4bac196857c520b6d3d8b33e8f0d8a3a8156dac066b82c128411ce9d563"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.156.0/agent-compose-linux-amd64"
      sha256 "f6d2706320a0a48f9a00a17a7cde41a546b2a3ea5b393b4fb53832d0757413e2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.156.0/agent-compose-linux-arm64"
      sha256 "9d65c7b8a72d023bb418c4f2fb1ee59c0033fd74bb81b355f345aca4aa247c3d"
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
