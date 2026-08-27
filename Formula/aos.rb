class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.252.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aos-darwin-arm64"
      sha256 "1f0dd09239b17a0f8ad67ed70a23ffb3a284b2102e6af98ff0ed02f622563b3c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aoscompose-darwin-arm64"
        sha256 "1f0dd09239b17a0f8ad67ed70a23ffb3a284b2102e6af98ff0ed02f622563b3c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aosward-darwin-arm64"
        sha256 "1f0dd09239b17a0f8ad67ed70a23ffb3a284b2102e6af98ff0ed02f622563b3c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aosguard-darwin-arm64"
        sha256 "7f79c0e3d32da8fc9c833cea7a0acc8080801350abf038a487bbfec1442b8c09"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aterm-darwin-arm64"
        sha256 "e88f0765ed5aee6850be7b60062e7b6c280d6cd60565b25a4fba935a639dfa1e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aos-linux-amd64"
      sha256 "7f3ad4f1b22f7356175ede7d266dfeb0b5abcf1a143a9a5e992dd87866eab777"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aoscompose-linux-amd64"
        sha256 "7f3ad4f1b22f7356175ede7d266dfeb0b5abcf1a143a9a5e992dd87866eab777"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aosward-linux-amd64"
        sha256 "7f3ad4f1b22f7356175ede7d266dfeb0b5abcf1a143a9a5e992dd87866eab777"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aosguard-linux-amd64"
        sha256 "942f446699c57a809026f20e0fd6ca4eba22322636486d80f6ec025d6e6bf825"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aterm-linux-amd64"
        sha256 "697bad68c1c85d8124070f9aa270f6f93240d408f770bf6da6b6a8a128a553b6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aos-linux-arm64"
      sha256 "1dc260285a27b54c19b227354cf163f34b6bc473454439056c76e45776ecd966"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aoscompose-linux-arm64"
        sha256 "1dc260285a27b54c19b227354cf163f34b6bc473454439056c76e45776ecd966"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aosward-linux-arm64"
        sha256 "1dc260285a27b54c19b227354cf163f34b6bc473454439056c76e45776ecd966"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aosguard-linux-arm64"
        sha256 "3597d2e0cc496c4d61021ce049bcc89fad9006a24e75c58ed50d41dc164d897a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.252.0/aterm-linux-arm64"
        sha256 "edf35ab42add206dc15f9e1e230d4aadbda736e5adc0958a86440da2fe58c022"
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
