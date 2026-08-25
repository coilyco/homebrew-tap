class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.227.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aos-darwin-arm64"
      sha256 "a21bcfb5a993438f14517acb3e998bc15708d9a72d42c3578061656081b50363"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aoscompose-darwin-arm64"
        sha256 "a21bcfb5a993438f14517acb3e998bc15708d9a72d42c3578061656081b50363"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aosward-darwin-arm64"
        sha256 "a21bcfb5a993438f14517acb3e998bc15708d9a72d42c3578061656081b50363"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aosguard-darwin-arm64"
        sha256 "8599ab43cbcb00ccbfcc299eb082b3e1043d107dfe1703574cc9c64c851edd9f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aterm-darwin-arm64"
        sha256 "930ac3a12b20d40d7e753cad95d56e0144fcba760231fed1c04b07a5d4b56211"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aos-linux-amd64"
      sha256 "0956ecad96cb3dbf2d7c79bd07a6472b2e3c9b302249f58e2cad6df6d4fc365c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aoscompose-linux-amd64"
        sha256 "0956ecad96cb3dbf2d7c79bd07a6472b2e3c9b302249f58e2cad6df6d4fc365c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aosward-linux-amd64"
        sha256 "0956ecad96cb3dbf2d7c79bd07a6472b2e3c9b302249f58e2cad6df6d4fc365c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aosguard-linux-amd64"
        sha256 "a826f5e05ab1094b29e4bef66434e3991cbf16714b2c76afe0c3721415d40bb2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aterm-linux-amd64"
        sha256 "5a2abb98db05305bcdc597427bd107391d495cfefb2317433f995b42c8f4d62c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aos-linux-arm64"
      sha256 "34b1ccf1f2e6cee8866e09bf0c7ba11732805d6554d7425551fffefda7454013"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aoscompose-linux-arm64"
        sha256 "34b1ccf1f2e6cee8866e09bf0c7ba11732805d6554d7425551fffefda7454013"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aosward-linux-arm64"
        sha256 "34b1ccf1f2e6cee8866e09bf0c7ba11732805d6554d7425551fffefda7454013"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aosguard-linux-arm64"
        sha256 "0bd7157b2410dbbb84f72c8f7b05b4b2b18888ead43d4b0dbe5e80a50d532c18"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.227.0/aterm-linux-arm64"
        sha256 "287b05a23f81b189498089260bdfe17ad4975ff2d20ad15f4ac5615a267dc4da"
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
