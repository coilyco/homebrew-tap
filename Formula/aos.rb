class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.209.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aos-darwin-arm64"
      sha256 "287478d5d823b75925c5007d2f336905610ae36fdb1967e8dd1086c521a641e1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aoscompose-darwin-arm64"
        sha256 "287478d5d823b75925c5007d2f336905610ae36fdb1967e8dd1086c521a641e1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosward-darwin-arm64"
        sha256 "287478d5d823b75925c5007d2f336905610ae36fdb1967e8dd1086c521a641e1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosguard-darwin-arm64"
        sha256 "9c23280af0264cc7625207bf86f27e2cae81e753666052f454b3f28caa49a7f2"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/agent-terminal-darwin-arm64"
        sha256 "66b9e1a7276fe802b0e1c6b85821a7740e85cdbe3648058bba0a28eb3f5215f4"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosterm-darwin-arm64"
        sha256 "66b9e1a7276fe802b0e1c6b85821a7740e85cdbe3648058bba0a28eb3f5215f4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aos-linux-amd64"
      sha256 "cf63fef3c3456e67dd35ca80df8ff48a3b0853040ef7a41b6aceb1d5baac93e5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aoscompose-linux-amd64"
        sha256 "cf63fef3c3456e67dd35ca80df8ff48a3b0853040ef7a41b6aceb1d5baac93e5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosward-linux-amd64"
        sha256 "cf63fef3c3456e67dd35ca80df8ff48a3b0853040ef7a41b6aceb1d5baac93e5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosguard-linux-amd64"
        sha256 "e01641a48e27967f5cb6e91546e5b7b0daab40cf69050a09663a3556c7cba661"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/agent-terminal-linux-amd64"
        sha256 "eb2a0f87f3f98465822f386b1a33d69b625683c49acb486764d6800a08c2a344"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosterm-linux-amd64"
        sha256 "eb2a0f87f3f98465822f386b1a33d69b625683c49acb486764d6800a08c2a344"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aos-linux-arm64"
      sha256 "407b29918d569563d98b1b6950230c7e1ff53296322889a14bf42b6dec9d4d77"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aoscompose-linux-arm64"
        sha256 "407b29918d569563d98b1b6950230c7e1ff53296322889a14bf42b6dec9d4d77"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosward-linux-arm64"
        sha256 "407b29918d569563d98b1b6950230c7e1ff53296322889a14bf42b6dec9d4d77"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosguard-linux-arm64"
        sha256 "c7b93946bda268b7be94765df40ba1ac0d62d5a39170af03ae84fe3332ebb73e"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/agent-terminal-linux-arm64"
        sha256 "6375e3a6c47ba97e9df75e603ad9ba9b92621a634d87749a719cf5d3d06bd1c1"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.209.0/aosterm-linux-arm64"
        sha256 "6375e3a6c47ba97e9df75e603ad9ba9b92621a634d87749a719cf5d3d06bd1c1"
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
