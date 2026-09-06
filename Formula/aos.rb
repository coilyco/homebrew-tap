class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.305.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aos-darwin-arm64"
      sha256 "068763747649077276a7204f1ee17521b1503cb781b745e79e38dd69d69b41bb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aoscompose-darwin-arm64"
        sha256 "068763747649077276a7204f1ee17521b1503cb781b745e79e38dd69d69b41bb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aosward-darwin-arm64"
        sha256 "068763747649077276a7204f1ee17521b1503cb781b745e79e38dd69d69b41bb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aosguard-darwin-arm64"
        sha256 "30fd81179b0e2cc1ec8d348774acce0977dcb900ceb1ba407adfca49c98b3d12"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aterm-darwin-arm64"
        sha256 "67e37cc64c11f62b06c4fe5e244582507911e8c922aa4a3f1f9eedd5e650dd35"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aos-linux-amd64"
      sha256 "01e61e61c0f05c18da3adcb55f2ee4045a06a5635ca2a69ab398547541d1b882"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aoscompose-linux-amd64"
        sha256 "01e61e61c0f05c18da3adcb55f2ee4045a06a5635ca2a69ab398547541d1b882"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aosward-linux-amd64"
        sha256 "01e61e61c0f05c18da3adcb55f2ee4045a06a5635ca2a69ab398547541d1b882"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aosguard-linux-amd64"
        sha256 "62ddaa796c1d7353c46c3838e8ac4780b20065e94f05ea4ca1c00c8ef0251248"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aterm-linux-amd64"
        sha256 "ab0c51e987be48f8ed19cfe3c4707964ea26a98babe7026f2920780f34192548"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aos-linux-arm64"
      sha256 "2b627a8812c5db847ccf8695d965cf4fa2ca7abf7c45ec7bfb12deb9b61d36dd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aoscompose-linux-arm64"
        sha256 "2b627a8812c5db847ccf8695d965cf4fa2ca7abf7c45ec7bfb12deb9b61d36dd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aosward-linux-arm64"
        sha256 "2b627a8812c5db847ccf8695d965cf4fa2ca7abf7c45ec7bfb12deb9b61d36dd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aosguard-linux-arm64"
        sha256 "69e24a8f040850485e5f384464b589ef48cf916f79a98bda204ee921e81d127e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.305.0/aterm-linux-arm64"
        sha256 "ea683e38d17dc6d95cae1a65fbaf53414b38f0e317d8e307b9a6e80374888388"
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
