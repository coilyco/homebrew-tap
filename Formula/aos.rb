class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.384.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aos-darwin-arm64"
      sha256 "fa270aed7720b36f0aedddb6dfddb56946d1ce27cfbc87049e4b9d327ada9bcc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aoscompose-darwin-arm64"
        sha256 "fa270aed7720b36f0aedddb6dfddb56946d1ce27cfbc87049e4b9d327ada9bcc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aosward-darwin-arm64"
        sha256 "fa270aed7720b36f0aedddb6dfddb56946d1ce27cfbc87049e4b9d327ada9bcc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aosguard-darwin-arm64"
        sha256 "6101dd77a86d9a5e189245a86409e246227b1134e2ca14ad765d468438d09aea"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aterm-darwin-arm64"
        sha256 "ed7697c9f1e966d092507a49e2b8f397bf9603cf77738bcda612d2d553928553"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aos-linux-amd64"
      sha256 "795d909a8b7afdf51383fcedf182fffe7659267fe3faa0d81fe8dfd31c03c981"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aoscompose-linux-amd64"
        sha256 "795d909a8b7afdf51383fcedf182fffe7659267fe3faa0d81fe8dfd31c03c981"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aosward-linux-amd64"
        sha256 "795d909a8b7afdf51383fcedf182fffe7659267fe3faa0d81fe8dfd31c03c981"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aosguard-linux-amd64"
        sha256 "edb734481439c9de8fb78c6d2fc16ad268520b644094318f52ef94adf748cfcc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aterm-linux-amd64"
        sha256 "b53be5418e631b54ea90eecb645b19469a16d929c160a9327062a726a33563dc"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aos-linux-arm64"
      sha256 "73911e474777adb9c1c8b87f896aecdfaab3eba044325e10bcabbb40a2912ab5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aoscompose-linux-arm64"
        sha256 "73911e474777adb9c1c8b87f896aecdfaab3eba044325e10bcabbb40a2912ab5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aosward-linux-arm64"
        sha256 "73911e474777adb9c1c8b87f896aecdfaab3eba044325e10bcabbb40a2912ab5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aosguard-linux-arm64"
        sha256 "e0d16f7f5cda09b6e80eb886f1cc4069618ac70534cf0f1123135ef52582adb6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.384.0/aterm-linux-arm64"
        sha256 "10488d8222310c4613447ea0a34b52b051ef28ef41ee971e3f9d03e20d0fe273"
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
