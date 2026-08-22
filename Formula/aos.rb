class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.218.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aos-darwin-arm64"
      sha256 "b675c4079ef0e0a3e072fc3aaf0cd8e53c9117917b69b87a37510e95683b073f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aoscompose-darwin-arm64"
        sha256 "b675c4079ef0e0a3e072fc3aaf0cd8e53c9117917b69b87a37510e95683b073f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosward-darwin-arm64"
        sha256 "b675c4079ef0e0a3e072fc3aaf0cd8e53c9117917b69b87a37510e95683b073f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosguard-darwin-arm64"
        sha256 "56716ee88fdc6a79ef86ac750106eb2ef56b5b6719d9ecd4f2866e20769f56f9"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/agent-terminal-darwin-arm64"
        sha256 "c9ff7a947d2da8540b061d786fadc7eb68966ea61223cfe9b03211413ec19d5a"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosterm-darwin-arm64"
        sha256 "c9ff7a947d2da8540b061d786fadc7eb68966ea61223cfe9b03211413ec19d5a"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aos-linux-amd64"
      sha256 "f9af46ea6ba26f120cc11f6995e5d37096dc60d8a02e6b799810c59db3ebcc41"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aoscompose-linux-amd64"
        sha256 "f9af46ea6ba26f120cc11f6995e5d37096dc60d8a02e6b799810c59db3ebcc41"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosward-linux-amd64"
        sha256 "f9af46ea6ba26f120cc11f6995e5d37096dc60d8a02e6b799810c59db3ebcc41"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosguard-linux-amd64"
        sha256 "61a065ad3c3c64adc1db7aed0df003e30c594cfde4c775798b8022e1f321de2b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/agent-terminal-linux-amd64"
        sha256 "41920ddaf5ac81aa8bdd8a1024addf29de463d2cddf9ee56c424ebeb891b460c"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosterm-linux-amd64"
        sha256 "41920ddaf5ac81aa8bdd8a1024addf29de463d2cddf9ee56c424ebeb891b460c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aos-linux-arm64"
      sha256 "63a195cd6f6c30bf34246ccbd653d1e2f3e6a634926046c8ce8166ea6a4f3dce"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aoscompose-linux-arm64"
        sha256 "63a195cd6f6c30bf34246ccbd653d1e2f3e6a634926046c8ce8166ea6a4f3dce"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosward-linux-arm64"
        sha256 "63a195cd6f6c30bf34246ccbd653d1e2f3e6a634926046c8ce8166ea6a4f3dce"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosguard-linux-arm64"
        sha256 "27408bb8fe32358832714d2fe6563760c9d8c0e17b5e22eaa8caca856ff1d026"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/agent-terminal-linux-arm64"
        sha256 "2d203dee59623b0f068f2e3e518d584b2da6ab261055fe3e544b9e86d80b15c1"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.218.0/aosterm-linux-arm64"
        sha256 "2d203dee59623b0f068f2e3e518d584b2da6ab261055fe3e544b9e86d80b15c1"
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
