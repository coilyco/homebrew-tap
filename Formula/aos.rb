class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.147.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aos-darwin-arm64"
      sha256 "a429acc7144d48c05dee10d03e6c4fcc8d38678842a5d7e80924d4e5bd4ac103"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aoscompose-darwin-arm64"
        sha256 "a429acc7144d48c05dee10d03e6c4fcc8d38678842a5d7e80924d4e5bd4ac103"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aosward-darwin-arm64"
        sha256 "a429acc7144d48c05dee10d03e6c4fcc8d38678842a5d7e80924d4e5bd4ac103"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aosguard-darwin-arm64"
        sha256 "fbc2eac2218340afb06a50be0b8545c2df95170c27391fb0f3452a47605ab044"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/agent-terminal-darwin-arm64"
        sha256 "bf5423005ee7b53e54dad2eb790626a31e87d5b7e0fb377d16d3253a059002fc"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aos-linux-amd64"
      sha256 "008d1dcdac6316f6fa8a8d150d6a5797bf0096d50337954d6243642e91ab5157"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aoscompose-linux-amd64"
        sha256 "008d1dcdac6316f6fa8a8d150d6a5797bf0096d50337954d6243642e91ab5157"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aosward-linux-amd64"
        sha256 "008d1dcdac6316f6fa8a8d150d6a5797bf0096d50337954d6243642e91ab5157"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aosguard-linux-amd64"
        sha256 "1696c61fe9676fb8f8f4d036270ffc8a7cd018b1f8f5bce6c7939e6618a1d023"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/agent-terminal-linux-amd64"
        sha256 "f7f721ae319d26e5db42b8e1bce6e9e02fe276d3c949aaf827242ee5bb497062"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aos-linux-arm64"
      sha256 "6a6c02742729422fd78ae813b14e69bdda5a128e64925bf3b644ff96478c13ab"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aoscompose-linux-arm64"
        sha256 "6a6c02742729422fd78ae813b14e69bdda5a128e64925bf3b644ff96478c13ab"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aosward-linux-arm64"
        sha256 "6a6c02742729422fd78ae813b14e69bdda5a128e64925bf3b644ff96478c13ab"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/aosguard-linux-arm64"
        sha256 "28e3dbe889b61ecd3bb1cd3a9d13b4a72160262d08cdb05bdb673180c3dd6514"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.147.0/agent-terminal-linux-arm64"
        sha256 "11e85419741ce82242a9f52bfadfa3964be6aa1ef77f68854c2a009f053aa722"
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
