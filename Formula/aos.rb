class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.179.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aos-darwin-arm64"
      sha256 "92501cf819b6add3df149e8ec0c905a20d43482c4a42a9ca16a70a8745329173"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aoscompose-darwin-arm64"
        sha256 "92501cf819b6add3df149e8ec0c905a20d43482c4a42a9ca16a70a8745329173"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosward-darwin-arm64"
        sha256 "92501cf819b6add3df149e8ec0c905a20d43482c4a42a9ca16a70a8745329173"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosguard-darwin-arm64"
        sha256 "3fcd1aa1d3011de5bad88c8f45d79562ce0a045e018db0ad7157398e46e51922"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/agent-terminal-darwin-arm64"
        sha256 "3d7f1e702f2f34c88395509a16de5ee20ddc48790b50e8e8eb0db705508df1cb"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosterm-darwin-arm64"
        sha256 "3d7f1e702f2f34c88395509a16de5ee20ddc48790b50e8e8eb0db705508df1cb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aos-linux-amd64"
      sha256 "42a233e611bc32a4f9a03eb6517e58813579012dceb956e562d9e8cbb7ec8098"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aoscompose-linux-amd64"
        sha256 "42a233e611bc32a4f9a03eb6517e58813579012dceb956e562d9e8cbb7ec8098"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosward-linux-amd64"
        sha256 "42a233e611bc32a4f9a03eb6517e58813579012dceb956e562d9e8cbb7ec8098"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosguard-linux-amd64"
        sha256 "8b1eb8cd0f25e527dfc79059ef0d120ed67749696c36603711c8fceb7847c82d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/agent-terminal-linux-amd64"
        sha256 "4e05b2635ca48f0e04c35babe5ede4c0f9e850c61d944d69238d9dfb7ab1c2de"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosterm-linux-amd64"
        sha256 "4e05b2635ca48f0e04c35babe5ede4c0f9e850c61d944d69238d9dfb7ab1c2de"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aos-linux-arm64"
      sha256 "b76d19b5daaf0d98204095d20f33412e6f3e7aff6b74e3567a448594b5ec6566"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aoscompose-linux-arm64"
        sha256 "b76d19b5daaf0d98204095d20f33412e6f3e7aff6b74e3567a448594b5ec6566"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosward-linux-arm64"
        sha256 "b76d19b5daaf0d98204095d20f33412e6f3e7aff6b74e3567a448594b5ec6566"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosguard-linux-arm64"
        sha256 "67d75e5e36b05ea05ab077ac507aeb90e9fcb447f003c071b22a0200b869ed5b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/agent-terminal-linux-arm64"
        sha256 "d2f3b06137199504d16641f4bc0fdba8bcd6b3cdff82edda9268d24510309282"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.179.0/aosterm-linux-arm64"
        sha256 "d2f3b06137199504d16641f4bc0fdba8bcd6b3cdff82edda9268d24510309282"
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
