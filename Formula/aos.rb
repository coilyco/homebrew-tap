class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.146.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aos-darwin-arm64"
      sha256 "49d6cf8b12632f821f9164e1074829861a45f54b9990f7fee3925153919d4f12"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aoscompose-darwin-arm64"
        sha256 "49d6cf8b12632f821f9164e1074829861a45f54b9990f7fee3925153919d4f12"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aosward-darwin-arm64"
        sha256 "49d6cf8b12632f821f9164e1074829861a45f54b9990f7fee3925153919d4f12"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aosguard-darwin-arm64"
        sha256 "ef8fb190f935e70730247dc3db674582b8709222f918fd90e540072dd3b507ed"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/agent-terminal-darwin-arm64"
        sha256 "bce2583f88f1f6514af64629e04baf90de0dbe12ccee569f9084a44cf3d47335"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aos-linux-amd64"
      sha256 "d3753208bf9773405b1f743bf6774eeec8f58677a61c6ac5b174298e6d26aa63"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aoscompose-linux-amd64"
        sha256 "d3753208bf9773405b1f743bf6774eeec8f58677a61c6ac5b174298e6d26aa63"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aosward-linux-amd64"
        sha256 "d3753208bf9773405b1f743bf6774eeec8f58677a61c6ac5b174298e6d26aa63"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aosguard-linux-amd64"
        sha256 "8a69806885b207c3edd5a6c51e813c5ae2527b536181d9c4b20cdf56b4d4f558"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/agent-terminal-linux-amd64"
        sha256 "a926d213f09720d4720691232e36d57164a31cc2a780b10d7ab1cb1132caaf4d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aos-linux-arm64"
      sha256 "a93418426b076694f7e7917c0ca710b73ca56170f023471564654d321cbdda32"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aoscompose-linux-arm64"
        sha256 "a93418426b076694f7e7917c0ca710b73ca56170f023471564654d321cbdda32"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aosward-linux-arm64"
        sha256 "a93418426b076694f7e7917c0ca710b73ca56170f023471564654d321cbdda32"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/aosguard-linux-arm64"
        sha256 "5537f675d5ad6d190bbba616510d3af0d7b2b40ad029015bcb7a0266f71203c4"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.146.0/agent-terminal-linux-arm64"
        sha256 "fb1f26dd3ca712b3e85b18af08746c778e3aeb58daedc67b9bc2eb19a6ebbe9b"
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
