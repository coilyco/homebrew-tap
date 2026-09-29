class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.404.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aos-darwin-arm64"
      sha256 "35026291a0a5dd233fe0858f09e8a35e1ec9dc8db9b5fca196bc5fbf1926632f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aoscompose-darwin-arm64"
        sha256 "35026291a0a5dd233fe0858f09e8a35e1ec9dc8db9b5fca196bc5fbf1926632f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aosward-darwin-arm64"
        sha256 "35026291a0a5dd233fe0858f09e8a35e1ec9dc8db9b5fca196bc5fbf1926632f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aosguard-darwin-arm64"
        sha256 "02514e3a9e3ba8dfddfef60ff8d06cd6b0ffba0831405d0b6e202c7225c8d95c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aterm-darwin-arm64"
        sha256 "b48ae892cf06a429b30acca87a55ab8476f6031ed73ff6d470349e1918d699b6"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aos-linux-amd64"
      sha256 "3094997507f87a35599115fa230cc92f043c73b2888ca1e5745e6194a68a6d1e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aoscompose-linux-amd64"
        sha256 "3094997507f87a35599115fa230cc92f043c73b2888ca1e5745e6194a68a6d1e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aosward-linux-amd64"
        sha256 "3094997507f87a35599115fa230cc92f043c73b2888ca1e5745e6194a68a6d1e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aosguard-linux-amd64"
        sha256 "6eb08476067f25f0a60222d537e246418787b7ef40ae33529cd95d317f7f758f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aterm-linux-amd64"
        sha256 "8aab6262bc6da5e5d0387f0a8db5337fdc6c0a16d3a22b69ab1b4462ed02b6a7"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aos-linux-arm64"
      sha256 "63d61e7005e889169937911012fcd9b69d136e6f4e88a36bde6b7966def6194b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aoscompose-linux-arm64"
        sha256 "63d61e7005e889169937911012fcd9b69d136e6f4e88a36bde6b7966def6194b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aosward-linux-arm64"
        sha256 "63d61e7005e889169937911012fcd9b69d136e6f4e88a36bde6b7966def6194b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aosguard-linux-arm64"
        sha256 "343a80176dd952c52cd5673b8604fab5f0daf3c4c17c505efef4095b75c7ceab"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.404.0/aterm-linux-arm64"
        sha256 "c552b47abea7c73d64ed96c5c723aa28dea2a5e346fd1759d2cc7067694f9159"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
