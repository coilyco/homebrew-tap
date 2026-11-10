require_relative "../lib/private_github_release_download_strategy"

class AgentCompose < Formula
  desc "Core Roster context composition for native agent harnesses"
  homepage "https://github.com/coilyco/treehouse-servers"
  version "2.226.0"
  license "MIT"

  # Private release, read with Homebrew's own GitHub credentials. COI-3302.
  # The seed roster installs into the prefix, so upgrades keep an edited one.
  resource "roster" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.226.0/agent-compose-roster.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "6a03a603896b25f1c88d47220db2cd505fd0430a8ff34ae9d36d9aafbb6f415c"
  end

  # housecast composes at build time and never runs here, so the composed set
  # ships rather than the data behind it.
  resource "bundles" do
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.226.0/agent-compose-bundles.tar.gz",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "df8fc97f2b5c0510e12fb80ddd6b90e6f1b68ecb062d14b48d03cf41224d5c65"
  end

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.226.0/agent-compose-darwin-arm64",
    using: PrivateGitHubReleaseDownloadStrategy
    sha256 "c12e3a5f7f9675603442f743e1df33c5eaa2365c825cc1e7448816940b4b2c8f"
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.226.0/agent-compose-linux-amd64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "640abb082ab67e9a170c5839acb5c1b2495e21f5c60d37d3f323734b64480e35"
    end
    on_arm do
      url "https://github.com/coilyco/treehouse-servers/releases/download/agent-compose-v2.226.0/agent-compose-linux-arm64",
      using: PrivateGitHubReleaseDownloadStrategy
      sha256 "d4b06bf2be802dc150e40db5c796d4a961dda75bd385be9682da49c7abc4919e"
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
