class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.270.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aos-darwin-arm64"
      sha256 "b35561301f54c39029aec0afc895e2ede7e720dfc3e0726bb27d12d7190a1e2e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aoscompose-darwin-arm64"
        sha256 "b35561301f54c39029aec0afc895e2ede7e720dfc3e0726bb27d12d7190a1e2e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aosward-darwin-arm64"
        sha256 "b35561301f54c39029aec0afc895e2ede7e720dfc3e0726bb27d12d7190a1e2e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aosguard-darwin-arm64"
        sha256 "0a695c921b02e7d87efec796eb78cb01b45e474249d40899979ba0100c7e3021"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aterm-darwin-arm64"
        sha256 "abe455ea8f967a396bf0072d79b746f47a1031e0732a10a76e1224d22eb834bf"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aos-linux-amd64"
      sha256 "d7777ea54a1fb61afab6fcc1bcd3aceb109eeb0a255fd1f3334e7cc8bf143acc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aoscompose-linux-amd64"
        sha256 "d7777ea54a1fb61afab6fcc1bcd3aceb109eeb0a255fd1f3334e7cc8bf143acc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aosward-linux-amd64"
        sha256 "d7777ea54a1fb61afab6fcc1bcd3aceb109eeb0a255fd1f3334e7cc8bf143acc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aosguard-linux-amd64"
        sha256 "553fbfd80d213da47dd33b3bc359b197b00615705ea7c22e96176dd90d9f9388"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aterm-linux-amd64"
        sha256 "2e176c3d9d9d6a0ad9efba5aa256d4f2f04d9a0fca997db529096a4e9183fe98"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aos-linux-arm64"
      sha256 "77391151515cff59a0b10bc77aadb138b0449c1d70d690dfe54da8b09c14bb14"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aoscompose-linux-arm64"
        sha256 "77391151515cff59a0b10bc77aadb138b0449c1d70d690dfe54da8b09c14bb14"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aosward-linux-arm64"
        sha256 "77391151515cff59a0b10bc77aadb138b0449c1d70d690dfe54da8b09c14bb14"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aosguard-linux-arm64"
        sha256 "56254814dd56625e77764323e00ab026d2921287535bdd14697355e17b696b76"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.270.0/aterm-linux-arm64"
        sha256 "fa3a4926f695e361d0a884a9e9d8f4c8f538a87c44f903d88ebcddc031d61278"
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
