require_relative "../lib/private_github_release_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://github.com/coilyco/treehouse-servers"
  version "2.228.0"
  license "MIT"

  # Private release, read with Homebrew's own GitHub credentials. COI-3302.
  # The seed roster installs into the prefix, so upgrades keep an edited one.
  resource "roster" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.228.0/agent-compose-roster.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "6f551e0efbe00248286bf51de7e1db8c07b9044c21189801c3ffd2e39baa5ecb"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.228.0/agent-compose-bundles.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "dbe3cba637b9db13c9ea9f6d4afafbcb3374c50881eb5f07331c2d4fc8731fd7"
  end

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.228.0/agent-compose-darwin-arm64",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "68525213e9b33eb6e7b27aee9a57534fdd7c0652de0186a02a4baf511ff04919"
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.228.0/agent-compose-linux-amd64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "62e78a1510d654b86821a19b671afdd683f534f203d7884ed28ce2964eb1bec5"
    end
    on_arm do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.228.0/agent-compose-linux-arm64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "8a44b4e3074e76f55892b2cd3b6337bdc6f0d844e4b91de9bcd764504bbbf8c1"
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
