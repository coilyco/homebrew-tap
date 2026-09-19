class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.346.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aos-darwin-arm64"
      sha256 "e1c2b288608ec8b3d763277cbb0f35c8880ceacb594785c9b266352f02467f40"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aoscompose-darwin-arm64"
        sha256 "e1c2b288608ec8b3d763277cbb0f35c8880ceacb594785c9b266352f02467f40"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aosward-darwin-arm64"
        sha256 "e1c2b288608ec8b3d763277cbb0f35c8880ceacb594785c9b266352f02467f40"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aosguard-darwin-arm64"
        sha256 "9eeb14dd9055e6eb038983a21e8aed72cfcaf5a8bb0e2398395132bf1bbc1d67"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aterm-darwin-arm64"
        sha256 "6c73ed08de27eb906ca001f8fe4d03d23f6ac73a0dcd75e0f671be467ba795e1"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aos-linux-amd64"
      sha256 "f4fb077b460688d1d0d795210722b1a1742276c46fe21bda1c27d023727fa805"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aoscompose-linux-amd64"
        sha256 "f4fb077b460688d1d0d795210722b1a1742276c46fe21bda1c27d023727fa805"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aosward-linux-amd64"
        sha256 "f4fb077b460688d1d0d795210722b1a1742276c46fe21bda1c27d023727fa805"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aosguard-linux-amd64"
        sha256 "18663827cb1e55147e668fdd4a10635fd60e3c600e1db8dff9aca01bd6f4cbd9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aterm-linux-amd64"
        sha256 "9f76fbc39efc460b112ce8edd76d7cf0b7fccfd5a51f53f8905ef26829f3eb4e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aos-linux-arm64"
      sha256 "68bfce333756c7ef26ab522f3ad3334620919b7acd9626c539446a235d3b2c90"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aoscompose-linux-arm64"
        sha256 "68bfce333756c7ef26ab522f3ad3334620919b7acd9626c539446a235d3b2c90"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aosward-linux-arm64"
        sha256 "68bfce333756c7ef26ab522f3ad3334620919b7acd9626c539446a235d3b2c90"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aosguard-linux-arm64"
        sha256 "b7ea3376891aaffaa239f134c979930a43a7589d99a83c3b1f9b3e16b80e65f3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.346.0/aterm-linux-arm64"
        sha256 "e70ae64676745fd1a3b5e36ad0d00c83428aed08a738e5d3d7dc2cc4f0ef9bdf"
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
