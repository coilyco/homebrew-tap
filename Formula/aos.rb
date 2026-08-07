class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.190.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aos-darwin-arm64"
      sha256 "302867d99269b71db264963b43978af01cdd6edd351e2567faa3ff96729e3297"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aoscompose-darwin-arm64"
        sha256 "302867d99269b71db264963b43978af01cdd6edd351e2567faa3ff96729e3297"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosward-darwin-arm64"
        sha256 "302867d99269b71db264963b43978af01cdd6edd351e2567faa3ff96729e3297"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosguard-darwin-arm64"
        sha256 "747fe09ae0762ff629e56ee7bd24c9eeb862064a9ab1dc5a90e6cc954d19b474"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/agent-terminal-darwin-arm64"
        sha256 "d2f2775b151d6940feceaf152d7e89b37128c462f1d551e9dcef861da6aea971"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosterm-darwin-arm64"
        sha256 "d2f2775b151d6940feceaf152d7e89b37128c462f1d551e9dcef861da6aea971"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aos-linux-amd64"
      sha256 "3c00c53475f6fe43a896e00f63ce9f5e7e5c45d5f649ace765c2cbd4edb662ce"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aoscompose-linux-amd64"
        sha256 "3c00c53475f6fe43a896e00f63ce9f5e7e5c45d5f649ace765c2cbd4edb662ce"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosward-linux-amd64"
        sha256 "3c00c53475f6fe43a896e00f63ce9f5e7e5c45d5f649ace765c2cbd4edb662ce"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosguard-linux-amd64"
        sha256 "886c00678c6a72f1a691c8e23b5bd0eb37ac5f9f3ff12c1255d40735f96a6780"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/agent-terminal-linux-amd64"
        sha256 "5502ca889191bebdc9739be1dbd8b8de53842aeaf0b361c5baac9a3ae090424d"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosterm-linux-amd64"
        sha256 "5502ca889191bebdc9739be1dbd8b8de53842aeaf0b361c5baac9a3ae090424d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aos-linux-arm64"
      sha256 "d3e60354f327290ff4a17973b0f88fc0d67cb35702431d90c7ec09fc24c9aeab"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aoscompose-linux-arm64"
        sha256 "d3e60354f327290ff4a17973b0f88fc0d67cb35702431d90c7ec09fc24c9aeab"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosward-linux-arm64"
        sha256 "d3e60354f327290ff4a17973b0f88fc0d67cb35702431d90c7ec09fc24c9aeab"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosguard-linux-arm64"
        sha256 "2d05ec372e8d235ebd50d2291b23f177e601848263228438f2754a738ecdc512"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/agent-terminal-linux-arm64"
        sha256 "1f347657c9f48d19ff9891d8bb1eb95befcbfd22343265a709718b35e6ffa87f"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.190.0/aosterm-linux-arm64"
        sha256 "1f347657c9f48d19ff9891d8bb1eb95befcbfd22343265a709718b35e6ffa87f"
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
