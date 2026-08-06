class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.180.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aos-darwin-arm64"
      sha256 "89ca434e92a581934a2860d9b8a9d11bfb38fe60a006ed89ad0db3067062db64"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aoscompose-darwin-arm64"
        sha256 "89ca434e92a581934a2860d9b8a9d11bfb38fe60a006ed89ad0db3067062db64"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosward-darwin-arm64"
        sha256 "89ca434e92a581934a2860d9b8a9d11bfb38fe60a006ed89ad0db3067062db64"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosguard-darwin-arm64"
        sha256 "5bbe25ad092e5a383875df2880ca172f6b47ce047e66fc992f4d4eb40f20bf9b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/agent-terminal-darwin-arm64"
        sha256 "0d785ac98f64bbe74fbdcd7b618d0486fd998e9116986b8d81701bc34d723dec"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosterm-darwin-arm64"
        sha256 "0d785ac98f64bbe74fbdcd7b618d0486fd998e9116986b8d81701bc34d723dec"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aos-linux-amd64"
      sha256 "e7037bca8574537af1d6577799738c399a148f7ecbacdf42e4582fcdefd3a233"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aoscompose-linux-amd64"
        sha256 "e7037bca8574537af1d6577799738c399a148f7ecbacdf42e4582fcdefd3a233"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosward-linux-amd64"
        sha256 "e7037bca8574537af1d6577799738c399a148f7ecbacdf42e4582fcdefd3a233"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosguard-linux-amd64"
        sha256 "5b6e70115cfaea5d2d52c37a1ab236e66d182d23bb4b39a3c3743f9fde839a18"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/agent-terminal-linux-amd64"
        sha256 "30cfb68266bc5dbe2d4dfbe20f10a1f02cbae65bfc54a495afdd4509ac845f3a"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosterm-linux-amd64"
        sha256 "30cfb68266bc5dbe2d4dfbe20f10a1f02cbae65bfc54a495afdd4509ac845f3a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aos-linux-arm64"
      sha256 "1f4a12e74b845900c52a367b633f544b0fda7d83b3e890a476569b625d004e12"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aoscompose-linux-arm64"
        sha256 "1f4a12e74b845900c52a367b633f544b0fda7d83b3e890a476569b625d004e12"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosward-linux-arm64"
        sha256 "1f4a12e74b845900c52a367b633f544b0fda7d83b3e890a476569b625d004e12"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosguard-linux-arm64"
        sha256 "4b9f347da6431b875834c4c64424c327445f045132171353c235639b581b4742"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/agent-terminal-linux-arm64"
        sha256 "1f0193b668c6974c26256e1d0afd9a36342c0b499ce062aae82f174a79fdc9e5"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.180.0/aosterm-linux-arm64"
        sha256 "1f0193b668c6974c26256e1d0afd9a36342c0b499ce062aae82f174a79fdc9e5"
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
