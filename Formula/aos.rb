class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.420.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aos-darwin-arm64"
      sha256 "b6ce20c381f482d1a4ebf68abb6c1e1bfc28144cb4df6309a0592695d8351763"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aoscompose-darwin-arm64"
        sha256 "b6ce20c381f482d1a4ebf68abb6c1e1bfc28144cb4df6309a0592695d8351763"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aosward-darwin-arm64"
        sha256 "b6ce20c381f482d1a4ebf68abb6c1e1bfc28144cb4df6309a0592695d8351763"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aosguard-darwin-arm64"
        sha256 "94528b18a0827edcb04c3a14ecf69cda4b927e88e49776746fb7c1d53f2383ca"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aterm-darwin-arm64"
        sha256 "4769d4015815e19247b5a5e7b9ddaba9e4a862e169fd438f1bf7a6d057c6833e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aos-linux-amd64"
      sha256 "668bb18ff3fcd7a23af8d6138f3141ff61ab35c069a2ecc8ca1c5c24ffc65490"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aoscompose-linux-amd64"
        sha256 "668bb18ff3fcd7a23af8d6138f3141ff61ab35c069a2ecc8ca1c5c24ffc65490"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aosward-linux-amd64"
        sha256 "668bb18ff3fcd7a23af8d6138f3141ff61ab35c069a2ecc8ca1c5c24ffc65490"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aosguard-linux-amd64"
        sha256 "2f16f379943da6bffaaf5145668a1f4d9c2305e178aed968e299d45d05ccea03"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aterm-linux-amd64"
        sha256 "2d092a4ff2ff7d96ab441a307608f4bcd3fc68fd28f2b76aa5d00510d8b2ca24"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aos-linux-arm64"
      sha256 "b4c71f619bb88dcee77232baa8df78e893137ec1ef876a135c4c4d2fc78d9424"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aoscompose-linux-arm64"
        sha256 "b4c71f619bb88dcee77232baa8df78e893137ec1ef876a135c4c4d2fc78d9424"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aosward-linux-arm64"
        sha256 "b4c71f619bb88dcee77232baa8df78e893137ec1ef876a135c4c4d2fc78d9424"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aosguard-linux-arm64"
        sha256 "25bb90605ccd695ec63959f1fa1a3fdcb28855bf15186709967f651848567d5a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.420.0/aterm-linux-arm64"
        sha256 "c082a7eaa01cc6a0d5afaf43a21b386d1e28491a26d7dfecccbcdf8fa30563b8"
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
