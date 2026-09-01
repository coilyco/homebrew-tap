class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.287.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aos-darwin-arm64"
      sha256 "78d2e957efdaef2586ff3ea10a87bf1a7ace4d0ba8f916c8b2708dd407c1231d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aoscompose-darwin-arm64"
        sha256 "78d2e957efdaef2586ff3ea10a87bf1a7ace4d0ba8f916c8b2708dd407c1231d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aosward-darwin-arm64"
        sha256 "78d2e957efdaef2586ff3ea10a87bf1a7ace4d0ba8f916c8b2708dd407c1231d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aosguard-darwin-arm64"
        sha256 "c5f67decb9038068190a21323fa3ff175479525e8b76275dda4b8844074f1471"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aterm-darwin-arm64"
        sha256 "404a3ef85c092f11eec454db0354ffc9acdd4c2461e9a0b888f209b3d8f3c9b7"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aos-linux-amd64"
      sha256 "7fdbaf85eccb80a80698a6ef4db6eeb4f94be361448f51c0818ce2317c4f552a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aoscompose-linux-amd64"
        sha256 "7fdbaf85eccb80a80698a6ef4db6eeb4f94be361448f51c0818ce2317c4f552a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aosward-linux-amd64"
        sha256 "7fdbaf85eccb80a80698a6ef4db6eeb4f94be361448f51c0818ce2317c4f552a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aosguard-linux-amd64"
        sha256 "c1d42fcab85fe6bf6741e75709fa53112493b871ce4cfa045fa100c93586957e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aterm-linux-amd64"
        sha256 "ace3c6888a76e3a1afd171ae0db38f2f7c7e8f619cc25fe5b26295cf6c874d78"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aos-linux-arm64"
      sha256 "23c048636c9f2534c3f6285f3ec4fc0d2cc2a8f6a5dfe1eef4f0172a873815ea"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aoscompose-linux-arm64"
        sha256 "23c048636c9f2534c3f6285f3ec4fc0d2cc2a8f6a5dfe1eef4f0172a873815ea"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aosward-linux-arm64"
        sha256 "23c048636c9f2534c3f6285f3ec4fc0d2cc2a8f6a5dfe1eef4f0172a873815ea"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aosguard-linux-arm64"
        sha256 "5156c74a7841be9960ac5f6ac4aed4e62315c46510b92d4c898f0edd052dd476"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.287.0/aterm-linux-arm64"
        sha256 "be9f321a22c9443ff71af04ec6cce2396238f4ca4eb7c3d986c48a595070e857"
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
