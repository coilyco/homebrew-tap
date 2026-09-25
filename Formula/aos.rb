class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.368.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aos-darwin-arm64"
      sha256 "4f7358da32293e04bccb6c29ceebd9cac22155a43a623dfa7b31d659e3e2507c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aoscompose-darwin-arm64"
        sha256 "4f7358da32293e04bccb6c29ceebd9cac22155a43a623dfa7b31d659e3e2507c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aosward-darwin-arm64"
        sha256 "4f7358da32293e04bccb6c29ceebd9cac22155a43a623dfa7b31d659e3e2507c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aosguard-darwin-arm64"
        sha256 "b8b3fe13b8b09d0b7a19ebc91db6d73b6202096e7ae512ce69dd2946e08e4a6e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aterm-darwin-arm64"
        sha256 "4b1ddeedcb1d6343c4868dcc67786887b8c99c451935465a83b114a2acae8844"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aos-linux-amd64"
      sha256 "70c64b03ff0ef9f455fff730a47aae8e40f438ef332bd86fa6a5da4ade4f6edd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aoscompose-linux-amd64"
        sha256 "70c64b03ff0ef9f455fff730a47aae8e40f438ef332bd86fa6a5da4ade4f6edd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aosward-linux-amd64"
        sha256 "70c64b03ff0ef9f455fff730a47aae8e40f438ef332bd86fa6a5da4ade4f6edd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aosguard-linux-amd64"
        sha256 "8d13a12334b579960a21dff042a76b7c936d79add94f0fc23d1eea0364880fa9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aterm-linux-amd64"
        sha256 "1842a5833b84f21e8c50bc319c7c5d3a70ecffc69f9fd8a92741de470baf50c1"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aos-linux-arm64"
      sha256 "1be249f04aa60b112063fdc036fab5338dea5917c8766fc3d01a3b9af3aea7ca"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aoscompose-linux-arm64"
        sha256 "1be249f04aa60b112063fdc036fab5338dea5917c8766fc3d01a3b9af3aea7ca"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aosward-linux-arm64"
        sha256 "1be249f04aa60b112063fdc036fab5338dea5917c8766fc3d01a3b9af3aea7ca"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aosguard-linux-arm64"
        sha256 "954de4afdceeeac120fbc93afa5f13ad4d0058f6d327fd0a76a8b8c078b5bfa7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.368.0/aterm-linux-arm64"
        sha256 "a0cdaf7e27de488e7561053464e7e53110cce3a86a5e5982a8f5bf23c5da5a13"
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
