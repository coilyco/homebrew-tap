class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.468.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aos-darwin-arm64"
      sha256 "eeea7014d754931ab201e9439728301844af4f4084d88c8f36b6ecd9a77477c1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aoscompose-darwin-arm64"
        sha256 "eeea7014d754931ab201e9439728301844af4f4084d88c8f36b6ecd9a77477c1"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aosward-darwin-arm64"
        sha256 "eeea7014d754931ab201e9439728301844af4f4084d88c8f36b6ecd9a77477c1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aosguard-darwin-arm64"
        sha256 "67f41d2253a8fb471ebaf77038922630d300ec08bd46bd0a05610ff9ed375620"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aterm-darwin-arm64"
        sha256 "e0b0a59deee559cc94f722f989a68b530b14bc6178fdcbf5508e09c26443de18"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aos-linux-amd64"
      sha256 "5cab1725c1b36b52d522604f94c0528fcb8ea5290bca3fd349e9a59d1f4745d9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aoscompose-linux-amd64"
        sha256 "5cab1725c1b36b52d522604f94c0528fcb8ea5290bca3fd349e9a59d1f4745d9"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aosward-linux-amd64"
        sha256 "5cab1725c1b36b52d522604f94c0528fcb8ea5290bca3fd349e9a59d1f4745d9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aosguard-linux-amd64"
        sha256 "b639b9ea2088d9097b76a91060f85f3fa9797dd9977820e0549ac6e933f8cc2b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aterm-linux-amd64"
        sha256 "5d3dfecb85693566eb9908bdeb9dc70daa3487ce8295afb8db1ecad1aaeccb16"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aos-linux-arm64"
      sha256 "c131ee4e33b8fcbbe173f8a297fd98a46b091abb030f676fafcb990464531181"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aoscompose-linux-arm64"
        sha256 "c131ee4e33b8fcbbe173f8a297fd98a46b091abb030f676fafcb990464531181"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aosward-linux-arm64"
        sha256 "c131ee4e33b8fcbbe173f8a297fd98a46b091abb030f676fafcb990464531181"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aosguard-linux-arm64"
        sha256 "80f88bbac59a433a42dc95d7eb587e222191d7805bbd7efa7eb6fb999cc3db5b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.468.0/aterm-linux-arm64"
        sha256 "a3a2a7f9b79da8b7bd387b46a4c4b0bdae58962ca21a5d900d550f12a2c3d5fb"
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
