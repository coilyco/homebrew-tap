class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.290.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aos-darwin-arm64"
      sha256 "7d3c71ec53566dd6ef49be91fab7bc5bbcdfbbca3c516456690ad7881a5d5ed1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aoscompose-darwin-arm64"
        sha256 "7d3c71ec53566dd6ef49be91fab7bc5bbcdfbbca3c516456690ad7881a5d5ed1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aosward-darwin-arm64"
        sha256 "7d3c71ec53566dd6ef49be91fab7bc5bbcdfbbca3c516456690ad7881a5d5ed1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aosguard-darwin-arm64"
        sha256 "433c6a3090deda73db18d73ea388f503cc18cb9bd21f58f807a99ba3720168bc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aterm-darwin-arm64"
        sha256 "ea5a25706cecc6e3b7e4f5434e73cc9678a98152b26d9fb0fa6fec56fe4180cd"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aos-linux-amd64"
      sha256 "2959735e257bbec946cc426092c936d359a8684aaebd401d60a9c5aada26a3cf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aoscompose-linux-amd64"
        sha256 "2959735e257bbec946cc426092c936d359a8684aaebd401d60a9c5aada26a3cf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aosward-linux-amd64"
        sha256 "2959735e257bbec946cc426092c936d359a8684aaebd401d60a9c5aada26a3cf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aosguard-linux-amd64"
        sha256 "4232aea1da8cdb864274fa41268063fc5936be35298be74be002121132340a1c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aterm-linux-amd64"
        sha256 "7807b6fab3b1376126bf46e808fa9afd16ed6941aa6e1027294f29f0ebaa0dc5"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aos-linux-arm64"
      sha256 "c32b061048a6c75d439bc1b86790915f098350031d95cc3cda2293cb1f393cb3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aoscompose-linux-arm64"
        sha256 "c32b061048a6c75d439bc1b86790915f098350031d95cc3cda2293cb1f393cb3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aosward-linux-arm64"
        sha256 "c32b061048a6c75d439bc1b86790915f098350031d95cc3cda2293cb1f393cb3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aosguard-linux-arm64"
        sha256 "44de4075b4dccc3c7d87bf837e0b454174e16a4103183b0f67d457ccb3423804"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.290.0/aterm-linux-arm64"
        sha256 "3a732fdfd09747cb8f18deff953e7715541f407c67531be58ad30f6bc8549a95"
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
