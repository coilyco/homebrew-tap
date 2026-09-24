class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.360.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aos-darwin-arm64"
      sha256 "4c1498edb443192fb27b259139753cba423edd331c201c3874dcf99cdc31ba36"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aoscompose-darwin-arm64"
        sha256 "4c1498edb443192fb27b259139753cba423edd331c201c3874dcf99cdc31ba36"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aosward-darwin-arm64"
        sha256 "4c1498edb443192fb27b259139753cba423edd331c201c3874dcf99cdc31ba36"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aosguard-darwin-arm64"
        sha256 "558f0dffda817c32b37a87d3042cc58a397d619f8af0537e715fe93d0e7ac678"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aterm-darwin-arm64"
        sha256 "1a2acb4ce4f7c2207a00a96819e7d577083f45f6e93b73eb363d4384eea52700"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aos-linux-amd64"
      sha256 "6c2b8f9fae360ce9b8032d7fdc145366aed4a668eaaaff407e19726c08d9d9b4"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aoscompose-linux-amd64"
        sha256 "6c2b8f9fae360ce9b8032d7fdc145366aed4a668eaaaff407e19726c08d9d9b4"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aosward-linux-amd64"
        sha256 "6c2b8f9fae360ce9b8032d7fdc145366aed4a668eaaaff407e19726c08d9d9b4"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aosguard-linux-amd64"
        sha256 "68d9ff96bb8e0d73a1b28b011bec28083f0abf97ca367a5f64bcfd6e3f223c76"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aterm-linux-amd64"
        sha256 "8a922f1e5e4152e727e4fb8595b2d20b90bc739873acce93f3464fc9f10d9e49"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aos-linux-arm64"
      sha256 "f6c490cc4243d2b1693d6994166752ff7db8cd86eeccc2cdc463d111240a5874"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aoscompose-linux-arm64"
        sha256 "f6c490cc4243d2b1693d6994166752ff7db8cd86eeccc2cdc463d111240a5874"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aosward-linux-arm64"
        sha256 "f6c490cc4243d2b1693d6994166752ff7db8cd86eeccc2cdc463d111240a5874"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aosguard-linux-arm64"
        sha256 "cc2cd76c47dc49fc585c8506f97bb078f67506195b9b117bae170a8321419d88"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.360.0/aterm-linux-arm64"
        sha256 "7c3503baee8d0a6b499980c5cd8cf2364aea1ee18889d11729d2fb990a2140c4"
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
