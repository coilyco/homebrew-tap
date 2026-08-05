class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.158.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aos-darwin-arm64"
      sha256 "468a45639e9129c8134bb068092694d79005e4a58ae37ded61e912d96bcf6e67"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aoscompose-darwin-arm64"
        sha256 "468a45639e9129c8134bb068092694d79005e4a58ae37ded61e912d96bcf6e67"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aosward-darwin-arm64"
        sha256 "468a45639e9129c8134bb068092694d79005e4a58ae37ded61e912d96bcf6e67"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aosguard-darwin-arm64"
        sha256 "0ffe9a14814053e6fc2ee632b62101d12102c89b96b705ebbe5a67e4ec017498"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/agent-terminal-darwin-arm64"
        sha256 "6338a2b0447ca5f170140ec10100ab87fac9c085e6f59594930780d783d20f46"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aos-linux-amd64"
      sha256 "4c254eaf4d60e99d5cf9470dc930c3b0a12717ba5dd60e65db2c9218a5907944"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aoscompose-linux-amd64"
        sha256 "4c254eaf4d60e99d5cf9470dc930c3b0a12717ba5dd60e65db2c9218a5907944"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aosward-linux-amd64"
        sha256 "4c254eaf4d60e99d5cf9470dc930c3b0a12717ba5dd60e65db2c9218a5907944"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aosguard-linux-amd64"
        sha256 "f88d8adc064622e34b7116d81018d511fb4aebbea0258e69499ea14147fdbc88"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/agent-terminal-linux-amd64"
        sha256 "d95d861a22a84f4af65ba745b975c8412c89e04ca71bef9ec47f2bbf922da04d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aos-linux-arm64"
      sha256 "b173099c1a0dbfbb650cb47bac02bdb18631ba769e5020d6a4df229b7789c2a3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aoscompose-linux-arm64"
        sha256 "b173099c1a0dbfbb650cb47bac02bdb18631ba769e5020d6a4df229b7789c2a3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aosward-linux-arm64"
        sha256 "b173099c1a0dbfbb650cb47bac02bdb18631ba769e5020d6a4df229b7789c2a3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/aosguard-linux-arm64"
        sha256 "9d891cf41b9776364262ad92f8b8e1fb35645e9b69d941326cf9fa003685961f"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.158.0/agent-terminal-linux-arm64"
        sha256 "3c4b30e36819bb4d0e22c6537eaaad1ef13ba59a8c26fc18ccf26e89d584aa0b"
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
