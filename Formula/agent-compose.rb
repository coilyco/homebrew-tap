require_relative "../lib/private_github_release_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://github.com/coilyco/treehouse-servers"
  version "2.227.0"
  license "MIT"

  # Private release, read with Homebrew's own GitHub credentials. COI-3302.
  # The seed roster installs into the prefix, so upgrades keep an edited one.
  resource "roster" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.227.0/agent-compose-roster.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "abf57717175f198a5f68ba74aa022e67f2591f7049a7150876260b8135815eae"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.227.0/agent-compose-bundles.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "5eabf64710e93cb808b07c3c5d64da010f9435c2e1f7633ad76f919e3a8cfe10"
  end

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.227.0/agent-compose-darwin-arm64",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "a39990e2a0596b55e81b59016410e46e11653d68ce0955ff4554e67362ae5573"
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.227.0/agent-compose-linux-amd64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "9c9ca1b027720e964c95170ce216a037858f765c5b39fadbc14bd54b4766f360"
    end
    on_arm do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.227.0/agent-compose-linux-arm64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "78574b99d3a79fa4eed52f43e38ab0012a6b5bd3243e8130ac10b018f7ba3015"
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
