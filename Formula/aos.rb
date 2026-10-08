class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.448.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aos-darwin-arm64"
      sha256 "21f6590cea73ac5a6cbc265e212f564d3e18522aced25790400b7028c96096d1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aoscompose-darwin-arm64"
        sha256 "21f6590cea73ac5a6cbc265e212f564d3e18522aced25790400b7028c96096d1"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aosward-darwin-arm64"
        sha256 "21f6590cea73ac5a6cbc265e212f564d3e18522aced25790400b7028c96096d1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aosguard-darwin-arm64"
        sha256 "72114af6190470967750fab496544d6baf12431f3ca0bc7092b2163c41baa9a2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aterm-darwin-arm64"
        sha256 "45ca0e4e155a1bc4c4926be7d7892d9e81ebe0ffe5979fd9d2064faead01754f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aos-linux-amd64"
      sha256 "34a31b89c5e32b1e833650d6c6b38cb9299d200ceeb1000dc51070c3163f4399"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aoscompose-linux-amd64"
        sha256 "34a31b89c5e32b1e833650d6c6b38cb9299d200ceeb1000dc51070c3163f4399"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aosward-linux-amd64"
        sha256 "34a31b89c5e32b1e833650d6c6b38cb9299d200ceeb1000dc51070c3163f4399"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aosguard-linux-amd64"
        sha256 "629852e43b99428957aeb04f8907aac8c72b64b818bebe67370480d041619529"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aterm-linux-amd64"
        sha256 "3a2ea24dc2535e4f3d717a50c37c9659f04d7870a2a3394efa405c9d690b231b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aos-linux-arm64"
      sha256 "38c71f2e198cd25a897ba68c0530fbdadd62fb1701aec1a86d06ae0cd4629c6e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aoscompose-linux-arm64"
        sha256 "38c71f2e198cd25a897ba68c0530fbdadd62fb1701aec1a86d06ae0cd4629c6e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aosward-linux-arm64"
        sha256 "38c71f2e198cd25a897ba68c0530fbdadd62fb1701aec1a86d06ae0cd4629c6e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aosguard-linux-arm64"
        sha256 "f9bf41882fabc39b057fb2322756f0a6e0bc9da91ab9ddae5cbc773dc6fefd9f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.448.0/aterm-linux-arm64"
        sha256 "29e248a295c550d0070cbd4aa3bf079f0413679c996435ffc000e46725f14786"
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
