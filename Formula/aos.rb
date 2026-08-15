class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.204.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aos-darwin-arm64"
      sha256 "601e2d3f7ecec3bdc9af96dc7bab73b551d19bfae085c43b5ddbe52b4450bcd1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aoscompose-darwin-arm64"
        sha256 "601e2d3f7ecec3bdc9af96dc7bab73b551d19bfae085c43b5ddbe52b4450bcd1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosward-darwin-arm64"
        sha256 "601e2d3f7ecec3bdc9af96dc7bab73b551d19bfae085c43b5ddbe52b4450bcd1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosguard-darwin-arm64"
        sha256 "f2ae5cdfce1c1599e65a5499bf99704d5938dce4d4678e3901545666242ca3d1"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/agent-terminal-darwin-arm64"
        sha256 "ead68cd12fb88b6e3d102ada2ddbcd5ac114c92cb9b85260fb6d8007abacedb4"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosterm-darwin-arm64"
        sha256 "ead68cd12fb88b6e3d102ada2ddbcd5ac114c92cb9b85260fb6d8007abacedb4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aos-linux-amd64"
      sha256 "786e0c2bd8739143581fa0feb1385fe6923273dc308306f842b1467cb894d1f6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aoscompose-linux-amd64"
        sha256 "786e0c2bd8739143581fa0feb1385fe6923273dc308306f842b1467cb894d1f6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosward-linux-amd64"
        sha256 "786e0c2bd8739143581fa0feb1385fe6923273dc308306f842b1467cb894d1f6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosguard-linux-amd64"
        sha256 "8599907836e534de55143b6c22a9b15f7d2e3ccbdfe0aa6897b3b04b1495fa6a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/agent-terminal-linux-amd64"
        sha256 "a16e078cd9c558c360c00e6cc816f03e839036e33c5888b8c4c808a1dfaab558"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosterm-linux-amd64"
        sha256 "a16e078cd9c558c360c00e6cc816f03e839036e33c5888b8c4c808a1dfaab558"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aos-linux-arm64"
      sha256 "d29e4da73c8f9393f7a87119ea66da215839cd2e7cc0f33648e7ef61df814a43"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aoscompose-linux-arm64"
        sha256 "d29e4da73c8f9393f7a87119ea66da215839cd2e7cc0f33648e7ef61df814a43"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosward-linux-arm64"
        sha256 "d29e4da73c8f9393f7a87119ea66da215839cd2e7cc0f33648e7ef61df814a43"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosguard-linux-arm64"
        sha256 "6724e0dc6d4d170be5d93d625ffba2576c603905125bbaff6ad2a94aa27d30af"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/agent-terminal-linux-arm64"
        sha256 "22bf27ad0937221af4e2217f1379e66c3f85e66eca83aa533c0a4254bc3ce2b2"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.204.0/aosterm-linux-arm64"
        sha256 "22bf27ad0937221af4e2217f1379e66c3f85e66eca83aa533c0a4254bc3ce2b2"
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
