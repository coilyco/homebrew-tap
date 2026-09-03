class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.297.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aos-darwin-arm64"
      sha256 "83927bf2109f0b06c716859f64ee42e3712c47192ff353c5cb80121837ef3232"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aoscompose-darwin-arm64"
        sha256 "83927bf2109f0b06c716859f64ee42e3712c47192ff353c5cb80121837ef3232"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aosward-darwin-arm64"
        sha256 "83927bf2109f0b06c716859f64ee42e3712c47192ff353c5cb80121837ef3232"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aosguard-darwin-arm64"
        sha256 "54f7fd417f89bee112a2b31502146c8b539659894da0b1a2c2154f13b0270ce0"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aterm-darwin-arm64"
        sha256 "6b68cd8121c65a4469e5fe4bcb64d57e6d3309b680452096a9dc14a9c07e64fc"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aos-linux-amd64"
      sha256 "94c98dc0d01f654114f46b43310f813ac3d440d36a222ccf9130cb77f5c5b837"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aoscompose-linux-amd64"
        sha256 "94c98dc0d01f654114f46b43310f813ac3d440d36a222ccf9130cb77f5c5b837"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aosward-linux-amd64"
        sha256 "94c98dc0d01f654114f46b43310f813ac3d440d36a222ccf9130cb77f5c5b837"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aosguard-linux-amd64"
        sha256 "1082c34193c93a2e928642f4773992b63a371b310096ef33f94d026453ee9e8c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aterm-linux-amd64"
        sha256 "525ce93e59229374865828d83edeb67fc8a581d0578308b697484ddeedda0d94"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aos-linux-arm64"
      sha256 "2f7c294f34c112432e19d21bb732d00fcf2b314ab5d42f9b649628d401373b96"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aoscompose-linux-arm64"
        sha256 "2f7c294f34c112432e19d21bb732d00fcf2b314ab5d42f9b649628d401373b96"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aosward-linux-arm64"
        sha256 "2f7c294f34c112432e19d21bb732d00fcf2b314ab5d42f9b649628d401373b96"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aosguard-linux-arm64"
        sha256 "ca0b20d866c5058b4d1a94ebed06e4ad75c3cbd9155e8c3390ab24c712887a40"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.297.0/aterm-linux-arm64"
        sha256 "ba393c5b7da4fbf0433e4494b74bc6b4184c09c5a1288c06cb95e0c547a46251"
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
