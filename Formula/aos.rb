class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.289.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aos-darwin-arm64"
      sha256 "39282fdc5e818f6fd3aef028da36ad322213cd7f7d0ed5e6eb0b910ba16c9ad5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aoscompose-darwin-arm64"
        sha256 "39282fdc5e818f6fd3aef028da36ad322213cd7f7d0ed5e6eb0b910ba16c9ad5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aosward-darwin-arm64"
        sha256 "39282fdc5e818f6fd3aef028da36ad322213cd7f7d0ed5e6eb0b910ba16c9ad5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aosguard-darwin-arm64"
        sha256 "3d27596bbae7040900b8eb43299b71d5e892ecf47c7e1d44bd791dbb206cf7e4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aterm-darwin-arm64"
        sha256 "3e90a6346d2f675f008b112abc286c968886561c2ee31d27c1c842f12bd39b76"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aos-linux-amd64"
      sha256 "8c5177d8d04b289fdbd531bd27ae1cb12c6ac67ce5ecf930b8be2d5dbdb8b56a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aoscompose-linux-amd64"
        sha256 "8c5177d8d04b289fdbd531bd27ae1cb12c6ac67ce5ecf930b8be2d5dbdb8b56a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aosward-linux-amd64"
        sha256 "8c5177d8d04b289fdbd531bd27ae1cb12c6ac67ce5ecf930b8be2d5dbdb8b56a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aosguard-linux-amd64"
        sha256 "4f6dea0983f55f423c59cf4c6736f41e71f99c449602793b92726daeedaa26ed"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aterm-linux-amd64"
        sha256 "e45682a185d3c7ca3f54bdbbe1ec48fe26b76f6abda79cad3b20136ae74a1e1a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aos-linux-arm64"
      sha256 "9df533e79e06826e20dcaf6a5282c0c3ba236fc2b46cc8d1e841eae2d2937b4b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aoscompose-linux-arm64"
        sha256 "9df533e79e06826e20dcaf6a5282c0c3ba236fc2b46cc8d1e841eae2d2937b4b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aosward-linux-arm64"
        sha256 "9df533e79e06826e20dcaf6a5282c0c3ba236fc2b46cc8d1e841eae2d2937b4b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aosguard-linux-arm64"
        sha256 "013a865b06a0b17268722a4a38293a146ace97dbd392906cf23b85b9d2b38309"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.289.0/aterm-linux-arm64"
        sha256 "104648fcab1851bb459b51dcacfd600dd15cdfa14213f99a7f95bce87ecb7772"
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
