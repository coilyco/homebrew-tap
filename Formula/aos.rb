class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.645.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aos-darwin-arm64"
    sha256 "7c7d18aef99eec5fdebce357856892255b5c04a95001ac30eb021b2337469b0d"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aoscompose-darwin-arm64"
      sha256 "7c7d18aef99eec5fdebce357856892255b5c04a95001ac30eb021b2337469b0d"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aosguard-darwin-arm64"
      sha256 "13e7ac6784d068878cf5d5982a188f3beae51abd336d814ff9f7bb55d8baff4a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "3c6be17176d97a8f2bc8aad03c5c3441ed84c4aa1297ac0408664ad71b116b82"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aos-linux-amd64"
      sha256 "f8c043f793498ee5532613df6e13f25737cfbb7900eb884227465f95a8cd8ba5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aoscompose-linux-amd64"
        sha256 "f8c043f793498ee5532613df6e13f25737cfbb7900eb884227465f95a8cd8ba5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aosguard-linux-amd64"
        sha256 "fdbd60bd9977174b93e523eca7cc4d992edb5c1035a06a996ae9ee20643eaa34"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aterm-linux-amd64"
        sha256 "2f4522d0d7a09ea35ad41191d0b6ae571603655795df2e609070c771bc4e7a97"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aos-linux-arm64"
      sha256 "8be702fcf9e2cabca7c741dbe04528d11ac4c5d641cb255801fd3278e3011f8d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aoscompose-linux-arm64"
        sha256 "8be702fcf9e2cabca7c741dbe04528d11ac4c5d641cb255801fd3278e3011f8d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aosguard-linux-arm64"
        sha256 "a34db4a631c7c118f604fd8b9a193c5e6e45839f93db755249dab49b0abd683b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.645.0/aterm-linux-arm64"
        sha256 "92837fad163efdfca52be73c9c9185b0478842d184cc0158c3bc53dcbdf7ee45"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    # macOS installs the signed bundle, whole (:nounzip) because a stage would
    # step into it, and links bin/aterm to its executable. See docs/aos-cli.md.
    if OS.mac?
      resource("aterm").stage do
        system "tar", "-xzf", Dir["*.tar.gz"].first, "-C", prefix
      end
      bin.install_symlink prefix/"Treehouse.app/Contents/MacOS/aterm"
    else
      resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
