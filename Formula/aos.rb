class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.304.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aos-darwin-arm64"
      sha256 "1981caf9bcdd57781a1b9ec3b8db42bf461cfaf2c0df89f2dba830240b1487ff"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aoscompose-darwin-arm64"
        sha256 "1981caf9bcdd57781a1b9ec3b8db42bf461cfaf2c0df89f2dba830240b1487ff"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aosward-darwin-arm64"
        sha256 "1981caf9bcdd57781a1b9ec3b8db42bf461cfaf2c0df89f2dba830240b1487ff"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aosguard-darwin-arm64"
        sha256 "80ccb2ecc10be4ff26de60dea61266368611a41339afa731f2dc546ae06dd2af"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aterm-darwin-arm64"
        sha256 "128092be3e83bf726a0de4ab30790ec6097644d5a79338887351ea0cd6fb5bf4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aos-linux-amd64"
      sha256 "a079db7666556a36ccc95abb5def9814a69ae804fdcf3900e863cfc578231159"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aoscompose-linux-amd64"
        sha256 "a079db7666556a36ccc95abb5def9814a69ae804fdcf3900e863cfc578231159"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aosward-linux-amd64"
        sha256 "a079db7666556a36ccc95abb5def9814a69ae804fdcf3900e863cfc578231159"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aosguard-linux-amd64"
        sha256 "b038042ea01b8421c8a88fa51484abe3571ab2391a6ea57363aec6666aba9389"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aterm-linux-amd64"
        sha256 "0ac1d13bc68105bb78a73ab5b09ae35dc875a87c6c4b20175447ec6168ddac5f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aos-linux-arm64"
      sha256 "9490c5cfb2df8e83504f5b4279e99dbbf4767f53b04b3b9c3ae058d09e146ac8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aoscompose-linux-arm64"
        sha256 "9490c5cfb2df8e83504f5b4279e99dbbf4767f53b04b3b9c3ae058d09e146ac8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aosward-linux-arm64"
        sha256 "9490c5cfb2df8e83504f5b4279e99dbbf4767f53b04b3b9c3ae058d09e146ac8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aosguard-linux-arm64"
        sha256 "6d2cdb6beb86f80f6812234f5237380c085c7e4f6eb3a7823dca45bea312653e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.304.0/aterm-linux-arm64"
        sha256 "4b13e29fc27ee647d5c49f81f9c1f5b496f34abaa709079a76b0e1cb5bf2a1d1"
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
