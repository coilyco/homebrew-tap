class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.271.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aos-darwin-arm64"
      sha256 "3733a96b9829ddf7228e8f6e1a61583cafdf1e97d6efb1c4a39d61737445cbd2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aoscompose-darwin-arm64"
        sha256 "3733a96b9829ddf7228e8f6e1a61583cafdf1e97d6efb1c4a39d61737445cbd2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aosward-darwin-arm64"
        sha256 "3733a96b9829ddf7228e8f6e1a61583cafdf1e97d6efb1c4a39d61737445cbd2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aosguard-darwin-arm64"
        sha256 "01e3657e29762c147f915411195b618373d4f6c52f5decbf984c4670619c724e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aterm-darwin-arm64"
        sha256 "725a78086c8be554e9e403d0b2c2a719783827714c524030d4f7fa57e8b68169"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aos-linux-amd64"
      sha256 "cafdbe3a0af39d0db7398ad5d0c6fbee2126b75fb78ea437f19dcc8f97446419"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aoscompose-linux-amd64"
        sha256 "cafdbe3a0af39d0db7398ad5d0c6fbee2126b75fb78ea437f19dcc8f97446419"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aosward-linux-amd64"
        sha256 "cafdbe3a0af39d0db7398ad5d0c6fbee2126b75fb78ea437f19dcc8f97446419"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aosguard-linux-amd64"
        sha256 "04aa5abd843202d3a501e32bf123ae873af1e756d27464c62b89bb000d3b3a58"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aterm-linux-amd64"
        sha256 "30f59d85215ae7c1a0f51e69a2fe4b2835ab65f6304f145b2c0d6110e6fee6b5"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aos-linux-arm64"
      sha256 "11593e9e1eea40cca5855e650bf7bfa97923b4fa64e10cf9ba7667856c346c09"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aoscompose-linux-arm64"
        sha256 "11593e9e1eea40cca5855e650bf7bfa97923b4fa64e10cf9ba7667856c346c09"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aosward-linux-arm64"
        sha256 "11593e9e1eea40cca5855e650bf7bfa97923b4fa64e10cf9ba7667856c346c09"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aosguard-linux-arm64"
        sha256 "a83578de2b258c9a943f3c5be4c314c92ffd6045bb16939ee763d1446467af1f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.271.0/aterm-linux-arm64"
        sha256 "bb4156b45500082f61614740b5330fb162a43e4e4de5417ddfaa89557f6b5a35"
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
