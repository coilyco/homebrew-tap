class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.168.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aos-darwin-arm64"
      sha256 "b8e522f9d089d47789a728fd36c4f4cf25ab7a10689196a5863cabbf8fe7d0ec"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aoscompose-darwin-arm64"
        sha256 "b8e522f9d089d47789a728fd36c4f4cf25ab7a10689196a5863cabbf8fe7d0ec"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aosward-darwin-arm64"
        sha256 "b8e522f9d089d47789a728fd36c4f4cf25ab7a10689196a5863cabbf8fe7d0ec"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aosguard-darwin-arm64"
        sha256 "3b17ee78f812fa2fd00cf3f8c098e4ba223cd5bd5dd66648dae37003de6d6562"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/agent-terminal-darwin-arm64"
        sha256 "e9ef79300e828fb74f281a18b9d0320df1fdfa6708db2e79e1eaa1740e90e6e1"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aos-linux-amd64"
      sha256 "127eb697fdbf9972888b27c355c90b5e0a84fd5e3e486f1eac440e8819bb8ef7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aoscompose-linux-amd64"
        sha256 "127eb697fdbf9972888b27c355c90b5e0a84fd5e3e486f1eac440e8819bb8ef7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aosward-linux-amd64"
        sha256 "127eb697fdbf9972888b27c355c90b5e0a84fd5e3e486f1eac440e8819bb8ef7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aosguard-linux-amd64"
        sha256 "5bc71c373ee7720bf2b118d024f02921e1bd84ac6105fe538aa108712e1a68c9"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/agent-terminal-linux-amd64"
        sha256 "c4ffdff10b4f5ace1254f94ed0524bb3549422b3398573e79af03a97b9c69078"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aos-linux-arm64"
      sha256 "d9a9795ee692271221b96292134fbedcca8a683c3360f6449fa10568b03beed3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aoscompose-linux-arm64"
        sha256 "d9a9795ee692271221b96292134fbedcca8a683c3360f6449fa10568b03beed3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aosward-linux-arm64"
        sha256 "d9a9795ee692271221b96292134fbedcca8a683c3360f6449fa10568b03beed3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/aosguard-linux-arm64"
        sha256 "17526905c2829e0a77d58b30e4a7ec67221f7e06e99b012321d21c6d3f18107e"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.168.0/agent-terminal-linux-arm64"
        sha256 "a103c823b6f7c1ceb28291f699bb0a39f2d691154ca7d2cd466e4e2c560dc92c"
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
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
  end
end
