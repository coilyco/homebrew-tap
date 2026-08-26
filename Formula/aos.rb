class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.239.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aos-darwin-arm64"
      sha256 "6f5d30afa934cd11de2987fb63b8a4ea0f9a51635824e149f52d879c78e55e3c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aoscompose-darwin-arm64"
        sha256 "6f5d30afa934cd11de2987fb63b8a4ea0f9a51635824e149f52d879c78e55e3c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aosward-darwin-arm64"
        sha256 "6f5d30afa934cd11de2987fb63b8a4ea0f9a51635824e149f52d879c78e55e3c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aosguard-darwin-arm64"
        sha256 "41d0bb1455894c2a658e79f3846c26b359d745ed6b474804c6f1f56af9fca796"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aterm-darwin-arm64"
        sha256 "6a98b546aac34ea20074bf4cac3a9f51a8e4b7e46fbfc14cd2d39c70ce9713d9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aos-linux-amd64"
      sha256 "babec0f4862c328fa503bdf00843440a37a646f29c8ec0b043d8b39a73d038d2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aoscompose-linux-amd64"
        sha256 "babec0f4862c328fa503bdf00843440a37a646f29c8ec0b043d8b39a73d038d2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aosward-linux-amd64"
        sha256 "babec0f4862c328fa503bdf00843440a37a646f29c8ec0b043d8b39a73d038d2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aosguard-linux-amd64"
        sha256 "c470c2cb06afa0828c9ff010d1cdb6b0077f716e70bb8e74e9800495b07c5846"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aterm-linux-amd64"
        sha256 "3e1c174c741e6f3aae7b849178695f7fde097d41ea5d7ef61e828c07d8462a33"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aos-linux-arm64"
      sha256 "24ace3cf0c0699392e87838abafe1492000079ee109ea68bb21d24c293e80e9c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aoscompose-linux-arm64"
        sha256 "24ace3cf0c0699392e87838abafe1492000079ee109ea68bb21d24c293e80e9c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aosward-linux-arm64"
        sha256 "24ace3cf0c0699392e87838abafe1492000079ee109ea68bb21d24c293e80e9c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aosguard-linux-arm64"
        sha256 "8013fa7d22cce0aea8bda7d73f2c0437a7ec01187cc809938a692c6c0c2198e4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.239.0/aterm-linux-arm64"
        sha256 "f849cbd006f74c4d516d1a938382ccc613b9c1fcc15f9142adb974a0c80cd6d7"
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
