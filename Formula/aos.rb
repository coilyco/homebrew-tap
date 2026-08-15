class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.203.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aos-darwin-arm64"
      sha256 "1cc914370197bc1a827d42d5487a9ecc6fa90c037f44d0d646e01322eb21e29e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aoscompose-darwin-arm64"
        sha256 "1cc914370197bc1a827d42d5487a9ecc6fa90c037f44d0d646e01322eb21e29e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosward-darwin-arm64"
        sha256 "1cc914370197bc1a827d42d5487a9ecc6fa90c037f44d0d646e01322eb21e29e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosguard-darwin-arm64"
        sha256 "265af6f2e9a58f4ae602b565fa9c899d6a54c12a002bf02a5f468e1deefd220d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/agent-terminal-darwin-arm64"
        sha256 "fab10222b104c579dd374693953b42c5300e2012049495e3404ec0e45017320c"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosterm-darwin-arm64"
        sha256 "fab10222b104c579dd374693953b42c5300e2012049495e3404ec0e45017320c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aos-linux-amd64"
      sha256 "00cdda472583db234ee03243a53564bdfb3b30c2645c8eaee3df605cf756092b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aoscompose-linux-amd64"
        sha256 "00cdda472583db234ee03243a53564bdfb3b30c2645c8eaee3df605cf756092b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosward-linux-amd64"
        sha256 "00cdda472583db234ee03243a53564bdfb3b30c2645c8eaee3df605cf756092b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosguard-linux-amd64"
        sha256 "548022401458df98c3a41509f898b7fe81f4da5cd67082fc8c81acd41613de65"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/agent-terminal-linux-amd64"
        sha256 "87adfb59e702ab51eb9aa19fc838c715c241ba1f832082b7ddf219b69ba5b1e4"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosterm-linux-amd64"
        sha256 "87adfb59e702ab51eb9aa19fc838c715c241ba1f832082b7ddf219b69ba5b1e4"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aos-linux-arm64"
      sha256 "717443a2d2fad6b6ec1deb64df88aa199a28206c4c2be8f82034174bcc66b9af"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aoscompose-linux-arm64"
        sha256 "717443a2d2fad6b6ec1deb64df88aa199a28206c4c2be8f82034174bcc66b9af"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosward-linux-arm64"
        sha256 "717443a2d2fad6b6ec1deb64df88aa199a28206c4c2be8f82034174bcc66b9af"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosguard-linux-arm64"
        sha256 "f89d35107f52d7db4394ba61fe182babb31aa442049a9a4d1ff065441fdf1f94"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/agent-terminal-linux-arm64"
        sha256 "dc40a13a637a113c11aed07901748a02145ffa9c5cdad38b0002ef24876aa8c1"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.203.0/aosterm-linux-arm64"
        sha256 "dc40a13a637a113c11aed07901748a02145ffa9c5cdad38b0002ef24876aa8c1"
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
