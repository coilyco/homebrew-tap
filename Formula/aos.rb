class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.171.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aos-darwin-arm64"
      sha256 "80401cbbefd20437228229391f2d0693bdf5b69f93059d921ecdfa8871094738"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aoscompose-darwin-arm64"
        sha256 "80401cbbefd20437228229391f2d0693bdf5b69f93059d921ecdfa8871094738"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aosward-darwin-arm64"
        sha256 "80401cbbefd20437228229391f2d0693bdf5b69f93059d921ecdfa8871094738"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aosguard-darwin-arm64"
        sha256 "d3b1edccdf40e3214b6a96cdb64f48b01f0f85ddcea79de1a6d3b9624219003a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/agent-terminal-darwin-arm64"
        sha256 "c72af6bd47f8cde3c4ddd85d07fe25011e31e11cfa8db0557e1af9b2e08b4cfd"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aos-linux-amd64"
      sha256 "09a10ee17f8912320bfa244a6745a74edfc1d6c4bd46b09ecfea04e8a51ea5ff"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aoscompose-linux-amd64"
        sha256 "09a10ee17f8912320bfa244a6745a74edfc1d6c4bd46b09ecfea04e8a51ea5ff"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aosward-linux-amd64"
        sha256 "09a10ee17f8912320bfa244a6745a74edfc1d6c4bd46b09ecfea04e8a51ea5ff"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aosguard-linux-amd64"
        sha256 "7ee24764c4d912ff7657f1a03e71d9b4ed3601f4f7ea0c019926601a2f7ec697"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/agent-terminal-linux-amd64"
        sha256 "1d52fe351190039d7e5f7d1e9ab34f43572464c485172c61f482d0f33b1c42f7"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aos-linux-arm64"
      sha256 "874698f8beebb852e3f6f941d149b3eaf3373dc5012ea444c32e5376c6c3d477"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aoscompose-linux-arm64"
        sha256 "874698f8beebb852e3f6f941d149b3eaf3373dc5012ea444c32e5376c6c3d477"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aosward-linux-arm64"
        sha256 "874698f8beebb852e3f6f941d149b3eaf3373dc5012ea444c32e5376c6c3d477"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/aosguard-linux-arm64"
        sha256 "08a592021b0d993b2503196b0704c903a79cac9efd79c644a629c49ccb04b1f8"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.171.0/agent-terminal-linux-arm64"
        sha256 "d78c78c1035e41f15dc14d95acaf730f89d69ddf2ba766c11a1f98c27cb229da"
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
