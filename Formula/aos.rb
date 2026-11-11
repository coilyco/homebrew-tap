class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.586.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aos-darwin-arm64"
    sha256 "2c6dc716bdf5783575a323d03b8218233ad0d28e1d5d5f97a3ca2ef5c7812cba"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aoscompose-darwin-arm64"
      sha256 "2c6dc716bdf5783575a323d03b8218233ad0d28e1d5d5f97a3ca2ef5c7812cba"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aosguard-darwin-arm64"
      sha256 "f8ddda2f7a119e3607649ce58a67f124433bea674586dc0151abcfca6ea7853d"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "118074036eb543a863f6b32098f9638c5b43d8dad8dbce3e9f700e93c249918f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aos-linux-amd64"
      sha256 "c283125e513fc46310c531f1d943bff75faa30f686de856dc905d078c181ac22"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aoscompose-linux-amd64"
        sha256 "c283125e513fc46310c531f1d943bff75faa30f686de856dc905d078c181ac22"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aosguard-linux-amd64"
        sha256 "60555f8fcd2f070da50f8f4768947fabe761e278f942219c89ba7486a790f304"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aterm-linux-amd64"
        sha256 "af7f55bfba35331a10a129649f7852ffc312ed1313e12feb0c3e3da115c3ccd2"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aos-linux-arm64"
      sha256 "6976de7e362be7fc6ff0dfe094e727b7462dcfff093bb9c226d6962fdb14939b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aoscompose-linux-arm64"
        sha256 "6976de7e362be7fc6ff0dfe094e727b7462dcfff093bb9c226d6962fdb14939b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aosguard-linux-arm64"
        sha256 "f5891052d694ac05d98811af6ca0a23286ce66eead139afe74b1d1a4b8f8995e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.586.0/aterm-linux-arm64"
        sha256 "20ca4bec5cec83f73d997dc3e7ebdf01957723b0dacb923efd5e12aa6ca62605"
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
