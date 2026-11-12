require_relative "../lib/private_github_release_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://github.com/coilyco/treehouse-servers"
  version "2.229.0"
  license "MIT"

  # Private release, read with Homebrew's own GitHub credentials. COI-3302.
  # The seed roster installs into the prefix, so upgrades keep an edited one.
  resource "roster" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.229.0/agent-compose-roster.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "e9cb4f91e1f3f395ce6d41954ea72ccf3ed9e0a676e27820783d900bd458d122"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.229.0/agent-compose-bundles.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "af8979da4c0704122c580202853ac19b47879a3192dedfeb2195be4e93e65208"
  end

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.229.0/agent-compose-darwin-arm64",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "d50197953097e372a5102b1fdc9d5ef3576ff9ded387b446232f6e3396ee1932"
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.229.0/agent-compose-linux-amd64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "be348406d050ba622a679ec07864b961d18060374e8918a13dc946dec961d78b"
    end
    on_arm do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.229.0/agent-compose-linux-arm64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "54e54922ffe8971cb53a7a62965dbb3548d144798d404ab61e0c297554be4fdb"
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
