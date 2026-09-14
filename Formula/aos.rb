class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.333.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aos-darwin-arm64"
      sha256 "611ff70aa3199492755df8e5c3a10e71a259abd442bf21ba81be04a0de8ee494"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aoscompose-darwin-arm64"
        sha256 "611ff70aa3199492755df8e5c3a10e71a259abd442bf21ba81be04a0de8ee494"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aosward-darwin-arm64"
        sha256 "611ff70aa3199492755df8e5c3a10e71a259abd442bf21ba81be04a0de8ee494"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aosguard-darwin-arm64"
        sha256 "cd07e6d15876895e614a397d89ebcbeea59c2e0a8e86714453a161f9a7c24f39"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aterm-darwin-arm64"
        sha256 "6b19f5ccb714fa32742c8d8ca539431622e9b46e627d99273310c39b43961651"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aos-linux-amd64"
      sha256 "d012524929585b0a2462bb751f4bcf24914b8ed942cbc6595f6e5c5beab564d5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aoscompose-linux-amd64"
        sha256 "d012524929585b0a2462bb751f4bcf24914b8ed942cbc6595f6e5c5beab564d5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aosward-linux-amd64"
        sha256 "d012524929585b0a2462bb751f4bcf24914b8ed942cbc6595f6e5c5beab564d5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aosguard-linux-amd64"
        sha256 "acf0a707c46becd4c1219c54429ed7b8e990ab009cfd8e7fff46c7ed157dd3aa"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aterm-linux-amd64"
        sha256 "b73f74ad8aed246c7e492e57edfe4a79ae2c50e36ce6a14c81a32c996a4d0aab"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aos-linux-arm64"
      sha256 "cbf2f6b8a242359b231a09686329c11271607a07adaffe9857976341f4e275ad"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aoscompose-linux-arm64"
        sha256 "cbf2f6b8a242359b231a09686329c11271607a07adaffe9857976341f4e275ad"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aosward-linux-arm64"
        sha256 "cbf2f6b8a242359b231a09686329c11271607a07adaffe9857976341f4e275ad"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aosguard-linux-arm64"
        sha256 "32be543be479d65f88d0860d41913f080abb8cca558ba3978927f5f42f17726f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.333.0/aterm-linux-arm64"
        sha256 "c33542b5b65dd46c7cfbc0fb2b2ff7fdb00dd21662bbe33cd5171f7f4fd58aaf"
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
