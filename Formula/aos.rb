class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.313.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aos-darwin-arm64"
      sha256 "b78087dc54bfc9bc4340f5c4af27da589cdc0705a061d322597421b0411ecc3d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aoscompose-darwin-arm64"
        sha256 "b78087dc54bfc9bc4340f5c4af27da589cdc0705a061d322597421b0411ecc3d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aosward-darwin-arm64"
        sha256 "b78087dc54bfc9bc4340f5c4af27da589cdc0705a061d322597421b0411ecc3d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aosguard-darwin-arm64"
        sha256 "b08bdab7c3498057376da0d170fd842e38c04c1f6740b3a34988994e5319d1b4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aterm-darwin-arm64"
        sha256 "6ec3121e00481ec6ac9a2764067d8535b7124d17832fa1253c492895aa35dd40"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aos-linux-amd64"
      sha256 "e8075a25868af0764f338706c358e8d6e00566795da0ea4dc83df36dfc5d3a93"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aoscompose-linux-amd64"
        sha256 "e8075a25868af0764f338706c358e8d6e00566795da0ea4dc83df36dfc5d3a93"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aosward-linux-amd64"
        sha256 "e8075a25868af0764f338706c358e8d6e00566795da0ea4dc83df36dfc5d3a93"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aosguard-linux-amd64"
        sha256 "d1ba9ee6e8ab0aa4ea2b665fd53fd0cdedac49476ad8cba8cb7e969ac9a1b2ad"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aterm-linux-amd64"
        sha256 "c12295f53ba059b7f416698856ca397f19fb2b2043769712981fcd3e9069fa0b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aos-linux-arm64"
      sha256 "be3cd1d754537dd3125bc6db80cfc0c13d169bb04932135ffb451f4f06b79482"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aoscompose-linux-arm64"
        sha256 "be3cd1d754537dd3125bc6db80cfc0c13d169bb04932135ffb451f4f06b79482"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aosward-linux-arm64"
        sha256 "be3cd1d754537dd3125bc6db80cfc0c13d169bb04932135ffb451f4f06b79482"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aosguard-linux-arm64"
        sha256 "1d6e233b81d806600ba0c56e86072423777c303705d29160543afcb3d94b8e96"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.313.0/aterm-linux-arm64"
        sha256 "35300a462073c18bdba66a1f868c74dd6c268554ecc7304acbfaa32b8122a749"
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
