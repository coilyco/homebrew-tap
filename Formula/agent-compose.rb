require_relative "../lib/private_github_release_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://github.com/coilyco/treehouse-servers"
  version "2.225.0"
  license "MIT"

  # Private release, read with Homebrew's own GitHub credentials. COI-3302.
  # The seed roster installs into the prefix, so upgrades keep an edited one.
  resource "roster" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.225.0/agent-compose-roster.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "5d4b108703bf512b35cff440f34c1d088152cbdab3c64c27b49f631a13fb5bcb"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.225.0/agent-compose-bundles.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "5ccba20e349afcf00832f20fb7d47c88b0f49be78ffb1def332a5836cbb3e704"
  end

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.225.0/agent-compose-darwin-arm64",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "73952c76420e04edf73cc68a36d2fd55f1fd3a2f340d81cad9d597046cf7f52c"
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.225.0/agent-compose-linux-amd64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "4172c09ce130771da2908f60cb253436bdc0df58643c56b5c5c7ad292c4cedca"
    end
    on_arm do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.225.0/agent-compose-linux-arm64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "e2a0aa11cd06cc7abb62d705bd4eccf480600cca6cfbae8daee4d6028fa46eed"
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
