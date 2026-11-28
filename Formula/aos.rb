class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.639.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aos-darwin-arm64"
    sha256 "e0955b32d12f97b15f16f8825c76d1a6a8c58550e6bd18b2268bdbb0b8d500b6"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aoscompose-darwin-arm64"
      sha256 "e0955b32d12f97b15f16f8825c76d1a6a8c58550e6bd18b2268bdbb0b8d500b6"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aosguard-darwin-arm64"
      sha256 "b1d00fec553aa359b86ef7fd6fc6953bd9ad08a488ecbd5e017a882800dab71b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "31af299b6babc96eada4aa93fb908d01e3d5fc5d61cd7ca6ee41e0fdf3118b95"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aos-linux-amd64"
      sha256 "f73def04c3ee92675f81ca7e0216528a67f6ece8eaf53e80b3fabcb568273630"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aoscompose-linux-amd64"
        sha256 "f73def04c3ee92675f81ca7e0216528a67f6ece8eaf53e80b3fabcb568273630"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aosguard-linux-amd64"
        sha256 "932c3121546edf3aa9c0ef7e023bfffe47b887dd23ab345450d830b8a0a66b6a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aterm-linux-amd64"
        sha256 "285f2d3153f90726cd652e4128191a03e6f6fddf9af8a1ca039d7ee4d29e982f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aos-linux-arm64"
      sha256 "e560810974ba25ac926b9113f736e7015549ceefb342fee8129635633d0df3ed"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aoscompose-linux-arm64"
        sha256 "e560810974ba25ac926b9113f736e7015549ceefb342fee8129635633d0df3ed"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aosguard-linux-arm64"
        sha256 "f10e20aafbe8a9f0d2b138a6fc33c9fe8ca03ef395fe016a919946c25d8d3f59"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.639.0/aterm-linux-arm64"
        sha256 "f1076db9bbd38ba1e1c95074b5a7166dbe17dd3e84f049cac5b04ec0e5fcf6cf"
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
