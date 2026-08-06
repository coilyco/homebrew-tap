class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.178.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aos-darwin-arm64"
      sha256 "5325a7e965c344233c0a7eb55d0dfa50d542ab4de95f9cab1cbf6f066add31bd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aoscompose-darwin-arm64"
        sha256 "5325a7e965c344233c0a7eb55d0dfa50d542ab4de95f9cab1cbf6f066add31bd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosward-darwin-arm64"
        sha256 "5325a7e965c344233c0a7eb55d0dfa50d542ab4de95f9cab1cbf6f066add31bd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosguard-darwin-arm64"
        sha256 "eb9b8745e4bfb82bcfb77b916063f059b50094187c405cb49e1777ee0817b6c0"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/agent-terminal-darwin-arm64"
        sha256 "c9487e3ed36a0cf3341dbcd605454bfe2a40a15131b0872aaf7480a87f2ecc75"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosterm-darwin-arm64"
        sha256 "c9487e3ed36a0cf3341dbcd605454bfe2a40a15131b0872aaf7480a87f2ecc75"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aos-linux-amd64"
      sha256 "26bd8f0486a80844629b2ecd6cb8c8febba8e3d8bc702d854a0960a412ff8795"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aoscompose-linux-amd64"
        sha256 "26bd8f0486a80844629b2ecd6cb8c8febba8e3d8bc702d854a0960a412ff8795"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosward-linux-amd64"
        sha256 "26bd8f0486a80844629b2ecd6cb8c8febba8e3d8bc702d854a0960a412ff8795"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosguard-linux-amd64"
        sha256 "148935a4ede9c31d3dfe14cab51b56e32bd30bb995322a333435ddc4a59c82af"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/agent-terminal-linux-amd64"
        sha256 "53b821b8fb43119ba06fdf912fd7596ee20c63a2c4dbcf25e702063d162a5567"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosterm-linux-amd64"
        sha256 "53b821b8fb43119ba06fdf912fd7596ee20c63a2c4dbcf25e702063d162a5567"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aos-linux-arm64"
      sha256 "b2da35a27cd417c4437f84e92da0dfcf3f22bb3c109769a16c189557def1af5a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aoscompose-linux-arm64"
        sha256 "b2da35a27cd417c4437f84e92da0dfcf3f22bb3c109769a16c189557def1af5a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosward-linux-arm64"
        sha256 "b2da35a27cd417c4437f84e92da0dfcf3f22bb3c109769a16c189557def1af5a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosguard-linux-arm64"
        sha256 "55d5e0832fbf392946af7b351daadd47fee686a5731b3b883ea459a0076ce207"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/agent-terminal-linux-arm64"
        sha256 "39b8efb86d64dfc463ae09b6f6856dcbf91097bd63f21efe7c3e75a5ae9332ec"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.178.0/aosterm-linux-arm64"
        sha256 "39b8efb86d64dfc463ae09b6f6856dcbf91097bd63f21efe7c3e75a5ae9332ec"
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
