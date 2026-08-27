class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.254.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aos-darwin-arm64"
      sha256 "dca73184f031bced00805d677f57de30c401269447155ccdfe6a21cc42fb6e69"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aoscompose-darwin-arm64"
        sha256 "dca73184f031bced00805d677f57de30c401269447155ccdfe6a21cc42fb6e69"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aosward-darwin-arm64"
        sha256 "dca73184f031bced00805d677f57de30c401269447155ccdfe6a21cc42fb6e69"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aosguard-darwin-arm64"
        sha256 "abb763fcfa994f0047c030e9f9ae20ed44aab8dc91084da7589c92a04c8ff60b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aterm-darwin-arm64"
        sha256 "9f230a4ae65fda3e780d2bea8ac9919ab50183476ff351528b2e414c98c0c0d7"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aos-linux-amd64"
      sha256 "4b6127caa6e163d50813265ea362759457313970be83ab9597c3b8be96dec7d5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aoscompose-linux-amd64"
        sha256 "4b6127caa6e163d50813265ea362759457313970be83ab9597c3b8be96dec7d5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aosward-linux-amd64"
        sha256 "4b6127caa6e163d50813265ea362759457313970be83ab9597c3b8be96dec7d5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aosguard-linux-amd64"
        sha256 "32055bfca663a6f58d877c2e8b71160abdbf539aa6c4546d6fc6a12e7780a4d5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aterm-linux-amd64"
        sha256 "bf4957e001f282405c50bb473334dccfe9e9295f981aaf9566f2bc72330ac5fc"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aos-linux-arm64"
      sha256 "3049b1b514e8c5789d614bbd479582f6c07f73aa56c6360d0a5ea6d9e0378fda"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aoscompose-linux-arm64"
        sha256 "3049b1b514e8c5789d614bbd479582f6c07f73aa56c6360d0a5ea6d9e0378fda"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aosward-linux-arm64"
        sha256 "3049b1b514e8c5789d614bbd479582f6c07f73aa56c6360d0a5ea6d9e0378fda"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aosguard-linux-arm64"
        sha256 "fcc2f908125616c91ce414dda21f431387e76e76a021e967ecb53821c2386082"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.254.0/aterm-linux-arm64"
        sha256 "0530be3ca510df29f7158b42ba17fcb2d719b806bf47a69955d1ef4ab609a4b3"
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
