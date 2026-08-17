class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.213.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aos-darwin-arm64"
      sha256 "3dfd7930ef02e7d41d4affe92695d969de7c2253ccedd3068987555ef8b1bf59"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aoscompose-darwin-arm64"
        sha256 "3dfd7930ef02e7d41d4affe92695d969de7c2253ccedd3068987555ef8b1bf59"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosward-darwin-arm64"
        sha256 "3dfd7930ef02e7d41d4affe92695d969de7c2253ccedd3068987555ef8b1bf59"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosguard-darwin-arm64"
        sha256 "c9a43e9f86e35975bf5cde156347c8bc90e6a3b7016a5adc63cabdeb0152393d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/agent-terminal-darwin-arm64"
        sha256 "84941409b8075ba3dfddf2074330fa0a64284d745cc3eaaabdceecc23e495c97"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosterm-darwin-arm64"
        sha256 "84941409b8075ba3dfddf2074330fa0a64284d745cc3eaaabdceecc23e495c97"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aos-linux-amd64"
      sha256 "32aec30cc32cdbb5aa8f817b7097a87a5d986625f38c3d38e68189d3ab55fe0a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aoscompose-linux-amd64"
        sha256 "32aec30cc32cdbb5aa8f817b7097a87a5d986625f38c3d38e68189d3ab55fe0a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosward-linux-amd64"
        sha256 "32aec30cc32cdbb5aa8f817b7097a87a5d986625f38c3d38e68189d3ab55fe0a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosguard-linux-amd64"
        sha256 "d00ca705d0ebf9ac872b607540f465a7e8252a08fec6b02984f263a76a3b48ac"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/agent-terminal-linux-amd64"
        sha256 "3924301490833519708b9325b7b4603f034325856bd8427dca76bcbdd2f4e64b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosterm-linux-amd64"
        sha256 "3924301490833519708b9325b7b4603f034325856bd8427dca76bcbdd2f4e64b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aos-linux-arm64"
      sha256 "5253f7d0cd1524c18e1095fd636160a45c0106108080c9d90f02e4f8843c59b6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aoscompose-linux-arm64"
        sha256 "5253f7d0cd1524c18e1095fd636160a45c0106108080c9d90f02e4f8843c59b6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosward-linux-arm64"
        sha256 "5253f7d0cd1524c18e1095fd636160a45c0106108080c9d90f02e4f8843c59b6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosguard-linux-arm64"
        sha256 "6fa2913f405ab4b37e1fc82a02950d76d3c661e8277bcc6c91d873c1509eedd6"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/agent-terminal-linux-arm64"
        sha256 "1802d608fc618f1e2b9ee5b2292d72bf10922c184fa049d981f6084ae2f65978"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.213.0/aosterm-linux-arm64"
        sha256 "1802d608fc618f1e2b9ee5b2292d72bf10922c184fa049d981f6084ae2f65978"
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
