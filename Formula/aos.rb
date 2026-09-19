class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.345.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aos-darwin-arm64"
      sha256 "da2ea80f988d6a5d9a61cc12d97e4d8123a7cf0c67cde188dda0eff8e9362cbf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aoscompose-darwin-arm64"
        sha256 "da2ea80f988d6a5d9a61cc12d97e4d8123a7cf0c67cde188dda0eff8e9362cbf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aosward-darwin-arm64"
        sha256 "da2ea80f988d6a5d9a61cc12d97e4d8123a7cf0c67cde188dda0eff8e9362cbf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aosguard-darwin-arm64"
        sha256 "686a1fa2e57242e167876bb99a6ecb528d32d11405a40d07d583725e2e2174ae"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aterm-darwin-arm64"
        sha256 "1da08bd2d0b977d5694585edfe877843652d06ac9c6819b777ad1b9a4b81ee40"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aos-linux-amd64"
      sha256 "8cd9b033a666accce406a2d850992aaa617acbbae2e1baaf3e9b9084a6f2b9cf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aoscompose-linux-amd64"
        sha256 "8cd9b033a666accce406a2d850992aaa617acbbae2e1baaf3e9b9084a6f2b9cf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aosward-linux-amd64"
        sha256 "8cd9b033a666accce406a2d850992aaa617acbbae2e1baaf3e9b9084a6f2b9cf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aosguard-linux-amd64"
        sha256 "c6d23590cb0f2905231e4708beebafbdc7b00cbd496185922449e1584fc573c4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aterm-linux-amd64"
        sha256 "98d7cb93da5872fa7cf19412343ab132451c60421f8c146e2106c68cecaaa31d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aos-linux-arm64"
      sha256 "8da028ae45d146bfbcfddc6e36fb784177e522ed1e01aae1386b20e782a48a8e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aoscompose-linux-arm64"
        sha256 "8da028ae45d146bfbcfddc6e36fb784177e522ed1e01aae1386b20e782a48a8e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aosward-linux-arm64"
        sha256 "8da028ae45d146bfbcfddc6e36fb784177e522ed1e01aae1386b20e782a48a8e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aosguard-linux-arm64"
        sha256 "daafd1bfb794bb9edf7b6bf4451e61531068b6943f19453ccb462201d438e6ab"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.345.0/aterm-linux-arm64"
        sha256 "10e6d8babb3c16863928e3fc594ea7ecbb54f80be53850629ff9e5ac20804aeb"
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
