class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.330.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aos-darwin-arm64"
      sha256 "a7beac685f50f7c1f45447315b9e31e4289ec123a8f6e3e554939d3fe60e2744"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aoscompose-darwin-arm64"
        sha256 "a7beac685f50f7c1f45447315b9e31e4289ec123a8f6e3e554939d3fe60e2744"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aosward-darwin-arm64"
        sha256 "a7beac685f50f7c1f45447315b9e31e4289ec123a8f6e3e554939d3fe60e2744"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aosguard-darwin-arm64"
        sha256 "97b1553303faac5e9a10d81945b8e4b601fdea4db5982219bb08876bf4420d02"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aterm-darwin-arm64"
        sha256 "e6cd0164aac93f25110fc89cd58714ca564cf3c7b307ac304417d52979a7b674"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aos-linux-amd64"
      sha256 "648fe766d4049e1cfaa201210cbd22b6d294e7dc3613a927d8e2aa17f4a07157"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aoscompose-linux-amd64"
        sha256 "648fe766d4049e1cfaa201210cbd22b6d294e7dc3613a927d8e2aa17f4a07157"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aosward-linux-amd64"
        sha256 "648fe766d4049e1cfaa201210cbd22b6d294e7dc3613a927d8e2aa17f4a07157"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aosguard-linux-amd64"
        sha256 "8cb77991c6b09a9c1cd01b374b622a99a47e2ec64f064aec6b969ba24a9b0dcc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aterm-linux-amd64"
        sha256 "b2fcfccd572cfeaf584ecddb0bdfcb13da7f2bac3b6929303a3bd07e329b5ccd"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aos-linux-arm64"
      sha256 "de1e3c3f81b08714b016665358e17c2086b72635f8186434b519c537f83396b8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aoscompose-linux-arm64"
        sha256 "de1e3c3f81b08714b016665358e17c2086b72635f8186434b519c537f83396b8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aosward-linux-arm64"
        sha256 "de1e3c3f81b08714b016665358e17c2086b72635f8186434b519c537f83396b8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aosguard-linux-arm64"
        sha256 "3906de406236178d87b0554a0688ded95293d7b9332e10079e7c7d8cd2d24c85"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.330.0/aterm-linux-arm64"
        sha256 "1e5f6066420fb3f7ea23214f53a263b428e720a9edd854452e4a67610a71d0ef"
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
