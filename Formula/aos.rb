class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.235.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aos-darwin-arm64"
      sha256 "e19bc3f5bbb1c27aab2f1b98f1b4e0ff299feed5a85d4810b110879524fe1221"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aoscompose-darwin-arm64"
        sha256 "e19bc3f5bbb1c27aab2f1b98f1b4e0ff299feed5a85d4810b110879524fe1221"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aosward-darwin-arm64"
        sha256 "e19bc3f5bbb1c27aab2f1b98f1b4e0ff299feed5a85d4810b110879524fe1221"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aosguard-darwin-arm64"
        sha256 "7d5d3843b63848544df7fca7ab30ea5ee41bfa5b0d845fa9b3c21bec7bb3a522"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aterm-darwin-arm64"
        sha256 "6d68d22b765895410d8c1ced381078637bf59ae3478afdecdd60c5ca613310c5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aos-linux-amd64"
      sha256 "2edd03e55e003e0c00f05786ed35fe81fb12014194720539d0fcaa433093a8d6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aoscompose-linux-amd64"
        sha256 "2edd03e55e003e0c00f05786ed35fe81fb12014194720539d0fcaa433093a8d6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aosward-linux-amd64"
        sha256 "2edd03e55e003e0c00f05786ed35fe81fb12014194720539d0fcaa433093a8d6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aosguard-linux-amd64"
        sha256 "419f8ef7962977ddc12746432a153578b874808235bae275eaff85285d1bd791"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aterm-linux-amd64"
        sha256 "2cc76ad68cee0a568171da7f09d40af86af0249ad26205dcf4da8c53fa5e956e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aos-linux-arm64"
      sha256 "3b5684495f74a7fe34763d4bfd351598efd663df804a3ffac96ceb558957a7e2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aoscompose-linux-arm64"
        sha256 "3b5684495f74a7fe34763d4bfd351598efd663df804a3ffac96ceb558957a7e2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aosward-linux-arm64"
        sha256 "3b5684495f74a7fe34763d4bfd351598efd663df804a3ffac96ceb558957a7e2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aosguard-linux-arm64"
        sha256 "214c792bda773885cd7a1a52f77b1727306d7b90ad3f0b2d0985138bff7442d9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.235.0/aterm-linux-arm64"
        sha256 "e348c4abe06d9acb1416d3180d3f8565fe94808c7205cb9907998e2305cdcf12"
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
