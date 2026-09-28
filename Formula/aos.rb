class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.396.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aos-darwin-arm64"
      sha256 "1515aad695b96e6f236b7970bd5bc1fabcccc68d4df6a6461d8dd89ab322baa6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aoscompose-darwin-arm64"
        sha256 "1515aad695b96e6f236b7970bd5bc1fabcccc68d4df6a6461d8dd89ab322baa6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aosward-darwin-arm64"
        sha256 "1515aad695b96e6f236b7970bd5bc1fabcccc68d4df6a6461d8dd89ab322baa6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aosguard-darwin-arm64"
        sha256 "21dac9af970ee605994c6e3000b73ac919815accf7a62cc3745cc2f929aee3b7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aterm-darwin-arm64"
        sha256 "c20d0526390ee5c449510f969ea8d2e026fb1c4910ca4d16e28e6bb931ea7484"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aos-linux-amd64"
      sha256 "7033ad4d10493a1eae339e8ab612f36c013bfabe06bcd65458e3e9ef5a1c96e3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aoscompose-linux-amd64"
        sha256 "7033ad4d10493a1eae339e8ab612f36c013bfabe06bcd65458e3e9ef5a1c96e3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aosward-linux-amd64"
        sha256 "7033ad4d10493a1eae339e8ab612f36c013bfabe06bcd65458e3e9ef5a1c96e3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aosguard-linux-amd64"
        sha256 "8dea7a25da16ad6a91f129902b2df243d7796cfffc93200e04a40a0a15ec8fdd"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aterm-linux-amd64"
        sha256 "56ea4b794935e76ba0b26925151bdb69418f7d520a6a838faf214c87754d340d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aos-linux-arm64"
      sha256 "6754f87cbb06463835c0ee26d4ab182b77e51b1199f8962354233cd6e8484b9b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aoscompose-linux-arm64"
        sha256 "6754f87cbb06463835c0ee26d4ab182b77e51b1199f8962354233cd6e8484b9b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aosward-linux-arm64"
        sha256 "6754f87cbb06463835c0ee26d4ab182b77e51b1199f8962354233cd6e8484b9b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aosguard-linux-arm64"
        sha256 "3b5ba9395c35ccd7e5c631f8f836dee48e0e38c839bc48e7539610d95b38368a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.396.0/aterm-linux-arm64"
        sha256 "a5f5ece760504c3b8b2b95045d531b8974f4b69c349ef05901ebaddd74ab7a81"
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
