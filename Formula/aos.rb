class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.599.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aos-darwin-arm64"
    sha256 "720d6d05b513bea292976dfd6c5edbb35c13af72498b6cbf3f2049364dc88f30"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aoscompose-darwin-arm64"
      sha256 "720d6d05b513bea292976dfd6c5edbb35c13af72498b6cbf3f2049364dc88f30"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aosguard-darwin-arm64"
      sha256 "d7e5e62c0fd08f2231a30d0fddb0ed1d5e1b444413347b53eec09587f84bb412"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "cb944ea58103554220d890ee8b23d02677e832a58217f3e5be31f911be63069d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aos-linux-amd64"
      sha256 "ed15e67b8113728ad97bb629806ac5a66dbdf25c89e1a04adab302925c86fc5f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aoscompose-linux-amd64"
        sha256 "ed15e67b8113728ad97bb629806ac5a66dbdf25c89e1a04adab302925c86fc5f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aosguard-linux-amd64"
        sha256 "bf0bcfb4144c365bc4acfb26146e7472115a21a5373823ccaf524edbf225e7c4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aterm-linux-amd64"
        sha256 "ab827546dc8b7227477cf4933101d88f07c92ab19cb944054baa98da1700ac5b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aos-linux-arm64"
      sha256 "175eeec8c8088ab8a98e27ddcd1285777858e77a0292c5e31d736cb29a406a87"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aoscompose-linux-arm64"
        sha256 "175eeec8c8088ab8a98e27ddcd1285777858e77a0292c5e31d736cb29a406a87"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aosguard-linux-arm64"
        sha256 "d162068677b4a674cd9ae1ae8c1791b7f4fac7fd7bb0e61e9cfdf776cae7d64d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.599.0/aterm-linux-arm64"
        sha256 "afccd8591661e7d0dbb854538f559277f1269f92ba436703c2ea2c3553dfc6c6"
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
