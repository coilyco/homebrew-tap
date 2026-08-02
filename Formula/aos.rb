class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.151.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aos-darwin-arm64"
      sha256 "f175986a51da24d874dba3c7b76dab70f00b00d51b4e198c1a8dbb0c069d5b23"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aoscompose-darwin-arm64"
        sha256 "f175986a51da24d874dba3c7b76dab70f00b00d51b4e198c1a8dbb0c069d5b23"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aosward-darwin-arm64"
        sha256 "f175986a51da24d874dba3c7b76dab70f00b00d51b4e198c1a8dbb0c069d5b23"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aosguard-darwin-arm64"
        sha256 "a66601099412c384d451ab3fff2762652545e743718690af8e8c618acaad13ce"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/agent-terminal-darwin-arm64"
        sha256 "25fbe758f5c071c355fa7db2e44baecc59cb82832ce06c2a6d960aefc3fd21d0"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aos-linux-amd64"
      sha256 "554200bc2997e3380be04e5de97896f7186aed9a95d04c6245b297a83de1e0d5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aoscompose-linux-amd64"
        sha256 "554200bc2997e3380be04e5de97896f7186aed9a95d04c6245b297a83de1e0d5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aosward-linux-amd64"
        sha256 "554200bc2997e3380be04e5de97896f7186aed9a95d04c6245b297a83de1e0d5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aosguard-linux-amd64"
        sha256 "7ac647d4dd1dc28afce8da4936119a4ca06559ec781e30960c7d8959227de0d4"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/agent-terminal-linux-amd64"
        sha256 "b3928c13ec2594bdc6324e957171a87bd502368898e313be845f537be1a437f6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aos-linux-arm64"
      sha256 "d52a6be170d44a267fafeca8341c92b0d78d2860226691ffceee8b3e54b81539"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aoscompose-linux-arm64"
        sha256 "d52a6be170d44a267fafeca8341c92b0d78d2860226691ffceee8b3e54b81539"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aosward-linux-arm64"
        sha256 "d52a6be170d44a267fafeca8341c92b0d78d2860226691ffceee8b3e54b81539"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/aosguard-linux-arm64"
        sha256 "e9fccda13ee09a7fd86a928e01f06037d674b41d051df1d45376d0b81ec4fae7"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.151.0/agent-terminal-linux-arm64"
        sha256 "d214d34b7aff17352d3f51489000e29bd22610894774426ee7c981164ac25bce"
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
