class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.378.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aos-darwin-arm64"
      sha256 "4a073f1842b858c526b3014fecff17d1f81e7d61fadc883bfbabc23a07b336f0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aoscompose-darwin-arm64"
        sha256 "4a073f1842b858c526b3014fecff17d1f81e7d61fadc883bfbabc23a07b336f0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aosward-darwin-arm64"
        sha256 "4a073f1842b858c526b3014fecff17d1f81e7d61fadc883bfbabc23a07b336f0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aosguard-darwin-arm64"
        sha256 "a77b45a220d822c98cd43fc40c3361bf9f4148da8e1d5ef78d18e20121797c7e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aterm-darwin-arm64"
        sha256 "96e89a1399e4f9dafb838786ece3fec82cbe71eb315f8e47f4b86edecf3a9f49"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aos-linux-amd64"
      sha256 "a5692dec8b915fb7e04e35970cca63957af2336a28e161e7a6feda8f34c628f1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aoscompose-linux-amd64"
        sha256 "a5692dec8b915fb7e04e35970cca63957af2336a28e161e7a6feda8f34c628f1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aosward-linux-amd64"
        sha256 "a5692dec8b915fb7e04e35970cca63957af2336a28e161e7a6feda8f34c628f1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aosguard-linux-amd64"
        sha256 "027d38533359b1ee04ed40eb10f8fa4b3a68410c8b7ec8bbaa1a45797af1393f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aterm-linux-amd64"
        sha256 "80fb1fb99636015fce813f42d759dfc0c0cf28defdc582ebc249fd8030b5018d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aos-linux-arm64"
      sha256 "03096a9fb7a0652ab4d9595b6de33a2b198d43c6a49fdbcb99f5865fbbd6b1c5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aoscompose-linux-arm64"
        sha256 "03096a9fb7a0652ab4d9595b6de33a2b198d43c6a49fdbcb99f5865fbbd6b1c5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aosward-linux-arm64"
        sha256 "03096a9fb7a0652ab4d9595b6de33a2b198d43c6a49fdbcb99f5865fbbd6b1c5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aosguard-linux-arm64"
        sha256 "19ff6cc9846840f8ea570cae65e0602dc560cb8e16d1fa52f2bb1a057cde19af"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.378.0/aterm-linux-arm64"
        sha256 "a036a2153de9e8f13f34f717c12685b5aa57710d00465d11f3530cb701b6ef35"
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
