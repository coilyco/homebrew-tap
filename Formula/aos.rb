class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.629.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aos-darwin-arm64"
    sha256 "64786a414d6a8a1885b9b8dd4820f82ccfc152faa0e23c2b12c8675a114d86a8"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aoscompose-darwin-arm64"
      sha256 "64786a414d6a8a1885b9b8dd4820f82ccfc152faa0e23c2b12c8675a114d86a8"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aosguard-darwin-arm64"
      sha256 "be216db41e16f19f02ac3360f0feac6be82ea651c69094501d2d7ef0b2e2b5db"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d5bf92368cd266cd02e977de12929e0436ca40fac61c89aba9d03ef9107b501f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aos-linux-amd64"
      sha256 "22d9f4cd8de8501f4c61422376a35964f9530f4366675d1936e9e95ec4ef3581"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aoscompose-linux-amd64"
        sha256 "22d9f4cd8de8501f4c61422376a35964f9530f4366675d1936e9e95ec4ef3581"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aosguard-linux-amd64"
        sha256 "53dbb50405382ffd6a2a25b2a6cbe48c60b56f6bdf24efd2f8a075060ff72afe"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aterm-linux-amd64"
        sha256 "9f190cd6a4bd68d35775189563348d6e1474c23467a19a5f19334a61cbfc0466"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aos-linux-arm64"
      sha256 "98e0da95d379a9758e26e507f664a9fe10470a1d6bce3f6b5a55167c6c94595f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aoscompose-linux-arm64"
        sha256 "98e0da95d379a9758e26e507f664a9fe10470a1d6bce3f6b5a55167c6c94595f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aosguard-linux-arm64"
        sha256 "dc9a8786071e7c2a363d8b1ac39f08a2f308445a7ceedab2c2f2c8e91b8d001a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.629.0/aterm-linux-arm64"
        sha256 "78d700e812b81623aa05d6e117ede23fae9f8b2b094eb4e2ca99c707ceb41d15"
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
