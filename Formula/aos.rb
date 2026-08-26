class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.232.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aos-darwin-arm64"
      sha256 "02fe0695c02f7b9715d460c30818716fb251a5379e3cfc717efdf137c6f184ad"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aoscompose-darwin-arm64"
        sha256 "02fe0695c02f7b9715d460c30818716fb251a5379e3cfc717efdf137c6f184ad"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aosward-darwin-arm64"
        sha256 "02fe0695c02f7b9715d460c30818716fb251a5379e3cfc717efdf137c6f184ad"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aosguard-darwin-arm64"
        sha256 "98a56d0b04a16c04aaaf939646b17fdae3a243d7351b9f137a09af9ddf75bf5e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aterm-darwin-arm64"
        sha256 "d46df9d2469c6111cce0983de4277aa981addaeddce5cee1365fecf5fba2db44"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aos-linux-amd64"
      sha256 "c675fbc14378c6820810677b6e837b49baca442386f6a57e8389ffbb19c98302"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aoscompose-linux-amd64"
        sha256 "c675fbc14378c6820810677b6e837b49baca442386f6a57e8389ffbb19c98302"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aosward-linux-amd64"
        sha256 "c675fbc14378c6820810677b6e837b49baca442386f6a57e8389ffbb19c98302"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aosguard-linux-amd64"
        sha256 "bd80c9da6021d88850ee0e18f2c9cb4bf8ebc0f60141de805efbe8bd597202c3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aterm-linux-amd64"
        sha256 "af8e5fb92d0f932fcbc50fda71657b399f09fb7634bdf82cb5e1b111f1777a30"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aos-linux-arm64"
      sha256 "50799a38b447d296babe91809a4b29f369d09ba07b9a499b89c8b56e820062aa"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aoscompose-linux-arm64"
        sha256 "50799a38b447d296babe91809a4b29f369d09ba07b9a499b89c8b56e820062aa"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aosward-linux-arm64"
        sha256 "50799a38b447d296babe91809a4b29f369d09ba07b9a499b89c8b56e820062aa"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aosguard-linux-arm64"
        sha256 "67c3d1f480724282d500860a7d56b7888b92dfb910e619f757e443fe6d810ef5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.232.0/aterm-linux-arm64"
        sha256 "df9642896188c3355cd02878d10d478326547f6e312a4e59553414f0d272b900"
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
