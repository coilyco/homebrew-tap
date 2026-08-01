class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.148.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aos-darwin-arm64"
      sha256 "e1dbe10330b8bb63c3b4bce9e1f8efa6ce2bfe87cd7875f265fdae1568b9befb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aoscompose-darwin-arm64"
        sha256 "e1dbe10330b8bb63c3b4bce9e1f8efa6ce2bfe87cd7875f265fdae1568b9befb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aosward-darwin-arm64"
        sha256 "e1dbe10330b8bb63c3b4bce9e1f8efa6ce2bfe87cd7875f265fdae1568b9befb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aosguard-darwin-arm64"
        sha256 "afc4fd6a1d6e1de7d140b1058f96f7354373dee81d8fea4bf623033770362cf1"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/agent-terminal-darwin-arm64"
        sha256 "c6e20a81bed0959b99d033688c1e0cb4a73829eefc2695f87aad6b06a40546e3"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aos-linux-amd64"
      sha256 "9d07554e3b27690e832f60acd1fea89f7e8dbb32d8ee07934893fe1830f67e95"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aoscompose-linux-amd64"
        sha256 "9d07554e3b27690e832f60acd1fea89f7e8dbb32d8ee07934893fe1830f67e95"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aosward-linux-amd64"
        sha256 "9d07554e3b27690e832f60acd1fea89f7e8dbb32d8ee07934893fe1830f67e95"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aosguard-linux-amd64"
        sha256 "24e0f02dae702c8cad577349a694b68cca338f52c0b0a52841302d2c48bed099"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/agent-terminal-linux-amd64"
        sha256 "a864da512fe137e8858f81e234aec0a4944a96f14f578169b737a617fe0b1bce"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aos-linux-arm64"
      sha256 "7c0e59198f556078a00d83aaaef488dfc6a503725991f5775d062b7c6e08732a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aoscompose-linux-arm64"
        sha256 "7c0e59198f556078a00d83aaaef488dfc6a503725991f5775d062b7c6e08732a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aosward-linux-arm64"
        sha256 "7c0e59198f556078a00d83aaaef488dfc6a503725991f5775d062b7c6e08732a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/aosguard-linux-arm64"
        sha256 "27d3000daa7a09892a7003f14aae57fd214ede81526d59448e4f248c54896aa5"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.148.0/agent-terminal-linux-arm64"
        sha256 "1303d7dbd3e62535bda3d82248d1f7c46edc3c048ead12713ac1a01891116347"
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
