class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.214.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aos-darwin-arm64"
      sha256 "9b4d7e6c93b9baae6f170c3ac1f2a34ffb9621479f5332bfd55579088aeca61e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aoscompose-darwin-arm64"
        sha256 "9b4d7e6c93b9baae6f170c3ac1f2a34ffb9621479f5332bfd55579088aeca61e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosward-darwin-arm64"
        sha256 "9b4d7e6c93b9baae6f170c3ac1f2a34ffb9621479f5332bfd55579088aeca61e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosguard-darwin-arm64"
        sha256 "56ecfa6d8d2351f6e928ad807f787f212924605bf021fdc3851cb5b2b1763495"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/agent-terminal-darwin-arm64"
        sha256 "94465141702244d1c0275a0d3cd9cc1da05c87e549854595da8bcf96ed6af7b1"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosterm-darwin-arm64"
        sha256 "94465141702244d1c0275a0d3cd9cc1da05c87e549854595da8bcf96ed6af7b1"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aos-linux-amd64"
      sha256 "f124dd349722d0665930bc6b061a9ec9cd068561c2a669464e178d8cbd023cd3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aoscompose-linux-amd64"
        sha256 "f124dd349722d0665930bc6b061a9ec9cd068561c2a669464e178d8cbd023cd3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosward-linux-amd64"
        sha256 "f124dd349722d0665930bc6b061a9ec9cd068561c2a669464e178d8cbd023cd3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosguard-linux-amd64"
        sha256 "21459d4fc7caeb7be59fa7119ce577545213e4c53303922275267d3144945e00"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/agent-terminal-linux-amd64"
        sha256 "fe8e45d849c472969bc754f3efea4b43b0c7cd8768697c6b04615af8d375d31c"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosterm-linux-amd64"
        sha256 "fe8e45d849c472969bc754f3efea4b43b0c7cd8768697c6b04615af8d375d31c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aos-linux-arm64"
      sha256 "d897889321e256e7cc5f82f8c4c81ad682f534602fd9a187ff71af82f710d0c6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aoscompose-linux-arm64"
        sha256 "d897889321e256e7cc5f82f8c4c81ad682f534602fd9a187ff71af82f710d0c6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosward-linux-arm64"
        sha256 "d897889321e256e7cc5f82f8c4c81ad682f534602fd9a187ff71af82f710d0c6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosguard-linux-arm64"
        sha256 "b75ff10e829f934e0ee12e995f474899eccb06c5c8036b5f85747466fecb59a0"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/agent-terminal-linux-arm64"
        sha256 "47a11cd7d5f98219305b9e22a1a9cff18836e9c713045b872840c4c3263e3ad8"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.214.0/aosterm-linux-arm64"
        sha256 "47a11cd7d5f98219305b9e22a1a9cff18836e9c713045b872840c4c3263e3ad8"
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
