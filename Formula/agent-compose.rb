class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose"
  version "2.186.0"
  license "MIT"

  # The seed roster installs into the prefix. acompose prefers an editable
  # roster in the state directory, so an upgrade never overwrites one.
  resource "roster" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.186.0/agent-compose-roster.tar.gz"
    sha256 "3ea16114e540c61b99e50686472e373274091950cf4c6feecfb3806fe8538752"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.186.0/agent-compose-bundles.tar.gz"
    sha256 "9fa0648c4a00b62543e97b60c295a3314a11c0ef7731b03ef28c92976b924c6b"
  end

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.186.0/agent-compose-darwin-arm64"
      sha256 "2a2cd0872d86b4330941dcfe1f88b929f90f05d45518d189c605b3cbf01eb4d9"
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.186.0/agent-compose-linux-amd64"
      sha256 "26089555dce52fc601464d6ac9f95c0fe700a8aa639608e46ddac16a36034df2"
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agent-compose/releases/download/v2.186.0/agent-compose-linux-arm64"
      sha256 "ab587c5d1a953ef1158854727617dff30ec4ed042ee568bbd6655455c65f33cd"
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
