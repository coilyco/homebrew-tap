class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.197.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aos-darwin-arm64"
      sha256 "d33535b7bb781a6a05d94ea6e47cd1fe73831d8f9d7e8b7d070203a1339ca59c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aoscompose-darwin-arm64"
        sha256 "d33535b7bb781a6a05d94ea6e47cd1fe73831d8f9d7e8b7d070203a1339ca59c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosward-darwin-arm64"
        sha256 "d33535b7bb781a6a05d94ea6e47cd1fe73831d8f9d7e8b7d070203a1339ca59c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosguard-darwin-arm64"
        sha256 "f41610ff84b3fd6a4fc8ab606afd8c581941636aea04f23188133816138ead41"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/agent-terminal-darwin-arm64"
        sha256 "0af33407e906121bab265333578e8acf73e48a7282572f649fb940e2ffbb00d5"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosterm-darwin-arm64"
        sha256 "0af33407e906121bab265333578e8acf73e48a7282572f649fb940e2ffbb00d5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aos-linux-amd64"
      sha256 "92ef4586c95c41f3f3a548cc5a8208b7c94b4fd1a211cc1226b9b19e213ebacd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aoscompose-linux-amd64"
        sha256 "92ef4586c95c41f3f3a548cc5a8208b7c94b4fd1a211cc1226b9b19e213ebacd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosward-linux-amd64"
        sha256 "92ef4586c95c41f3f3a548cc5a8208b7c94b4fd1a211cc1226b9b19e213ebacd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosguard-linux-amd64"
        sha256 "393ce2239e5dd6169ad9b38b855c85640a7945916a736107003c45885f63da49"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/agent-terminal-linux-amd64"
        sha256 "266ba9f61a07d1f6096a186711e997a4338a7059d051586029b0a35fa6e5ca4c"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosterm-linux-amd64"
        sha256 "266ba9f61a07d1f6096a186711e997a4338a7059d051586029b0a35fa6e5ca4c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aos-linux-arm64"
      sha256 "e708373d815d3f3af5c41702ed4883870943fb240af0b0a53a029e5b8bd1a75f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aoscompose-linux-arm64"
        sha256 "e708373d815d3f3af5c41702ed4883870943fb240af0b0a53a029e5b8bd1a75f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosward-linux-arm64"
        sha256 "e708373d815d3f3af5c41702ed4883870943fb240af0b0a53a029e5b8bd1a75f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosguard-linux-arm64"
        sha256 "f0a97172334fa38ebf788def407eb2c4d535cfdbe0b66477ca4d443cda2006f5"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/agent-terminal-linux-arm64"
        sha256 "ba3d8a15583a5566bcdacd9d0f67fbcca534c4687904d6b1d1bf9778bb94186d"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.197.0/aosterm-linux-arm64"
        sha256 "ba3d8a15583a5566bcdacd9d0f67fbcca534c4687904d6b1d1bf9778bb94186d"
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
