class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.281.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aos-darwin-arm64"
      sha256 "d52a3f5aa8a7a34cdf8ec215349f35848fa765c27ac7170c0bfe1c6b64e7f6ea"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aoscompose-darwin-arm64"
        sha256 "d52a3f5aa8a7a34cdf8ec215349f35848fa765c27ac7170c0bfe1c6b64e7f6ea"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aosward-darwin-arm64"
        sha256 "d52a3f5aa8a7a34cdf8ec215349f35848fa765c27ac7170c0bfe1c6b64e7f6ea"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aosguard-darwin-arm64"
        sha256 "b858d102bdbef31337ed3fea70801edc69adea0fe20546fd5a970fcaa384c634"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aterm-darwin-arm64"
        sha256 "264f035ef12b16a44389a8c7b34fc579a7b657f28a255f8e0dd8b116fa4daf8f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aos-linux-amd64"
      sha256 "0536f330194b8d1ba73da75e63be4777c5e939b9bb11b01999c820457f459507"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aoscompose-linux-amd64"
        sha256 "0536f330194b8d1ba73da75e63be4777c5e939b9bb11b01999c820457f459507"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aosward-linux-amd64"
        sha256 "0536f330194b8d1ba73da75e63be4777c5e939b9bb11b01999c820457f459507"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aosguard-linux-amd64"
        sha256 "80fdb003d3a69a2276af1f0e478e13169bb02ac3d610562c6a355adfbab574df"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aterm-linux-amd64"
        sha256 "5398af4801e6e0771fd0a49bc0518b081048ee776ff930042c3cf458109a7a07"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aos-linux-arm64"
      sha256 "95a17e0ba37d5833a4f24f020414227c83e1b02ed7286a8eb7cd2cb2a6a6991c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aoscompose-linux-arm64"
        sha256 "95a17e0ba37d5833a4f24f020414227c83e1b02ed7286a8eb7cd2cb2a6a6991c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aosward-linux-arm64"
        sha256 "95a17e0ba37d5833a4f24f020414227c83e1b02ed7286a8eb7cd2cb2a6a6991c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aosguard-linux-arm64"
        sha256 "e82f023f1d9cdd3ba867d6c87f5096e80eedac70925f95752b2c97ebb5ece8a3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.281.0/aterm-linux-arm64"
        sha256 "6c1dcaa07f558e67f83efc25b4e8e9dd88fdb7d63729a07dde839125fdf48291"
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
