class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.390.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aos-darwin-arm64"
      sha256 "9a129cff9a2d11d9f42d1c9b8b3d22c34bd09bf9c3422b6d76f39bfc8afbc36c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aoscompose-darwin-arm64"
        sha256 "9a129cff9a2d11d9f42d1c9b8b3d22c34bd09bf9c3422b6d76f39bfc8afbc36c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aosward-darwin-arm64"
        sha256 "9a129cff9a2d11d9f42d1c9b8b3d22c34bd09bf9c3422b6d76f39bfc8afbc36c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aosguard-darwin-arm64"
        sha256 "cc42ff024b14b6e67e58167f898114981c88126ce3b886e36e9e0a3052244a7b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aterm-darwin-arm64"
        sha256 "1bec2273ab0b0c5b8390fbee5d7a0d2615133cac1421716f1963f867aee8e3ab"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aos-linux-amd64"
      sha256 "afcb41160472593bbb362b5c575b89dacbf1c96f9b9080c971b52cd07141a904"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aoscompose-linux-amd64"
        sha256 "afcb41160472593bbb362b5c575b89dacbf1c96f9b9080c971b52cd07141a904"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aosward-linux-amd64"
        sha256 "afcb41160472593bbb362b5c575b89dacbf1c96f9b9080c971b52cd07141a904"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aosguard-linux-amd64"
        sha256 "766173831a57dc7a1f8cb3a9bc0980f05baf607a1afd7a7130c40f1b70486889"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aterm-linux-amd64"
        sha256 "5df21b99291911e8dca38446375b74708e7de7e7e514f7eba884719ad6e08d2a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aos-linux-arm64"
      sha256 "93f21e216a7583caddea7938ad6253852e12acfab6aee36c697c1a22708b92ba"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aoscompose-linux-arm64"
        sha256 "93f21e216a7583caddea7938ad6253852e12acfab6aee36c697c1a22708b92ba"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aosward-linux-arm64"
        sha256 "93f21e216a7583caddea7938ad6253852e12acfab6aee36c697c1a22708b92ba"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aosguard-linux-arm64"
        sha256 "bbe7437fdd91acd66448f19964001d186244ec592828481054c1d3d149b13633"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.390.0/aterm-linux-arm64"
        sha256 "a87499b7c8fcbd4a61f2c8c225d9f5efa7c13a53f97fa2ee0b0a39b97973cd9c"
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
