class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.199.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aos-darwin-arm64"
      sha256 "33d18ba4fcd914f8641723521be0a44c2680664bd54f4f61f35f4b558c4b4199"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aoscompose-darwin-arm64"
        sha256 "33d18ba4fcd914f8641723521be0a44c2680664bd54f4f61f35f4b558c4b4199"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosward-darwin-arm64"
        sha256 "33d18ba4fcd914f8641723521be0a44c2680664bd54f4f61f35f4b558c4b4199"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosguard-darwin-arm64"
        sha256 "c004c739e2d47d2c0fcd63277c0c82f821d6f9e39164a5fb1d30cabe28348270"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/agent-terminal-darwin-arm64"
        sha256 "e72b66d865f45031cc4a101651d3c7e01d88fdd1b16b71577d3aa947a4fec1a8"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosterm-darwin-arm64"
        sha256 "e72b66d865f45031cc4a101651d3c7e01d88fdd1b16b71577d3aa947a4fec1a8"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aos-linux-amd64"
      sha256 "739df21c2ceff5d8f7264fffd5d294c670ac2dca5e416e8938ef9e57898dd840"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aoscompose-linux-amd64"
        sha256 "739df21c2ceff5d8f7264fffd5d294c670ac2dca5e416e8938ef9e57898dd840"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosward-linux-amd64"
        sha256 "739df21c2ceff5d8f7264fffd5d294c670ac2dca5e416e8938ef9e57898dd840"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosguard-linux-amd64"
        sha256 "64ba0b609f16f43e6ab9003b343bf6e7302f03a51a5f43d149060a63813898f7"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/agent-terminal-linux-amd64"
        sha256 "8930b796316095b5a1ccd9f1c956dbb839e9710eff0b845861ba5eb283f8d3ac"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosterm-linux-amd64"
        sha256 "8930b796316095b5a1ccd9f1c956dbb839e9710eff0b845861ba5eb283f8d3ac"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aos-linux-arm64"
      sha256 "50189ed9bb1ae77082bbc6693ca791a8b81dbd1d0183e4907b2e6a8ac6091a1c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aoscompose-linux-arm64"
        sha256 "50189ed9bb1ae77082bbc6693ca791a8b81dbd1d0183e4907b2e6a8ac6091a1c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosward-linux-arm64"
        sha256 "50189ed9bb1ae77082bbc6693ca791a8b81dbd1d0183e4907b2e6a8ac6091a1c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosguard-linux-arm64"
        sha256 "e3051ed869a2693b4a2e271a2dc023b2aee5333fbc7fb7b52abb0f52256990f8"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/agent-terminal-linux-arm64"
        sha256 "ef022bbfbf6a07b87b2d37e7cd4088788d33831c674a6c42d5f11b8185f81349"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.199.0/aosterm-linux-arm64"
        sha256 "ef022bbfbf6a07b87b2d37e7cd4088788d33831c674a6c42d5f11b8185f81349"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("agent-terminal").stage { bin.install Dir["agent-terminal-*"].first => "agent-terminal" }
    resource("aosterm").stage { bin.install Dir["aosterm-*"].first => "aosterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
    assert_match version.to_s, shell_output("#{bin}/aosterm --version")
  end
end
