class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.374.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aos-darwin-arm64"
      sha256 "abaf912e9baab9f2c878750d62468c33f583e390c1580ee84dde0fb92c4fa113"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aoscompose-darwin-arm64"
        sha256 "abaf912e9baab9f2c878750d62468c33f583e390c1580ee84dde0fb92c4fa113"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aosward-darwin-arm64"
        sha256 "abaf912e9baab9f2c878750d62468c33f583e390c1580ee84dde0fb92c4fa113"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aosguard-darwin-arm64"
        sha256 "2cf4d9e8bef846de71035cb22ce87dbe70659a44ce18cef4e013984761366d05"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aterm-darwin-arm64"
        sha256 "8bbe127794f4b1d0637c8f148d008dcff4570d6ee4c813115c2f2e7926585285"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aos-linux-amd64"
      sha256 "6e0eed9d8c643e38b917aaf9cb5488229a6f67110b466faba5ea55e34360ce2b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aoscompose-linux-amd64"
        sha256 "6e0eed9d8c643e38b917aaf9cb5488229a6f67110b466faba5ea55e34360ce2b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aosward-linux-amd64"
        sha256 "6e0eed9d8c643e38b917aaf9cb5488229a6f67110b466faba5ea55e34360ce2b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aosguard-linux-amd64"
        sha256 "735033eb21e9b710506d6baa347447a8a72f0bea833004705ca8b03d644f3f26"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aterm-linux-amd64"
        sha256 "94623fe37f916b5442de928e78ca04283a56190b843204a4c9424a09d00d5dcc"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aos-linux-arm64"
      sha256 "599a4b762ec83676e49f8e56e2fc948c2fa322bee8e1b94a510a088114f8e5b7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aoscompose-linux-arm64"
        sha256 "599a4b762ec83676e49f8e56e2fc948c2fa322bee8e1b94a510a088114f8e5b7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aosward-linux-arm64"
        sha256 "599a4b762ec83676e49f8e56e2fc948c2fa322bee8e1b94a510a088114f8e5b7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aosguard-linux-arm64"
        sha256 "69227017aef7a75361a34597d33cbc5445b06693d56c10e63e2445908fd2550b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.374.0/aterm-linux-arm64"
        sha256 "03031e3a0e6c0e81d6d4df419a96bd8652379c06eeaa01edfa2b0e46b2261c26"
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
