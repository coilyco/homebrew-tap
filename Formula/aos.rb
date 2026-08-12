class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.195.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aos-darwin-arm64"
      sha256 "f1f8e1c7d098e6aed4979ff9f1348dd8bfdc740806c0d50c9310dab088023e82"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aoscompose-darwin-arm64"
        sha256 "f1f8e1c7d098e6aed4979ff9f1348dd8bfdc740806c0d50c9310dab088023e82"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosward-darwin-arm64"
        sha256 "f1f8e1c7d098e6aed4979ff9f1348dd8bfdc740806c0d50c9310dab088023e82"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosguard-darwin-arm64"
        sha256 "212e87616e0c639e881267ac39b643aecc5026d3a0f6bc43dc9d122e0cae91a4"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/agent-terminal-darwin-arm64"
        sha256 "4d16003ec96629157a0503efd1d3573b88453012ff15b19d47747ed9e13d62db"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosterm-darwin-arm64"
        sha256 "4d16003ec96629157a0503efd1d3573b88453012ff15b19d47747ed9e13d62db"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aos-linux-amd64"
      sha256 "a4ceb3d1aba22a9a33c1abc90c0036eecd47fbf1143387189fc7a4c4351dd551"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aoscompose-linux-amd64"
        sha256 "a4ceb3d1aba22a9a33c1abc90c0036eecd47fbf1143387189fc7a4c4351dd551"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosward-linux-amd64"
        sha256 "a4ceb3d1aba22a9a33c1abc90c0036eecd47fbf1143387189fc7a4c4351dd551"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosguard-linux-amd64"
        sha256 "e0646605dbb38013acaad52123cf184e6c0cad75ca5312821c5a18466b981e9f"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/agent-terminal-linux-amd64"
        sha256 "19b40309351e6ad7891107500f7a70798e80aec14be5a1aea096a7a2b53fa75e"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosterm-linux-amd64"
        sha256 "19b40309351e6ad7891107500f7a70798e80aec14be5a1aea096a7a2b53fa75e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aos-linux-arm64"
      sha256 "dd0192752d924f1bb1104644e768c8d751ec30e7cac43e0bf60d3f6db19d1282"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aoscompose-linux-arm64"
        sha256 "dd0192752d924f1bb1104644e768c8d751ec30e7cac43e0bf60d3f6db19d1282"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosward-linux-arm64"
        sha256 "dd0192752d924f1bb1104644e768c8d751ec30e7cac43e0bf60d3f6db19d1282"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosguard-linux-arm64"
        sha256 "dde7b95b2953fa86dcdfac5d3645f1ee808dc15c2767274e9899e0b0b975630b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/agent-terminal-linux-arm64"
        sha256 "6d7b6ee63b4dab47ff63f573deacec66bd102865a6f34e45b80a1eaafd1abf7e"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.195.0/aosterm-linux-arm64"
        sha256 "6d7b6ee63b4dab47ff63f573deacec66bd102865a6f34e45b80a1eaafd1abf7e"
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
