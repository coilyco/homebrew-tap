class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.172.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aos-darwin-arm64"
      sha256 "13fc82884811ad7a71ebac59bc900b8fe6f98a2b2edeb252768ea6712c3b2d34"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aoscompose-darwin-arm64"
        sha256 "13fc82884811ad7a71ebac59bc900b8fe6f98a2b2edeb252768ea6712c3b2d34"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosward-darwin-arm64"
        sha256 "13fc82884811ad7a71ebac59bc900b8fe6f98a2b2edeb252768ea6712c3b2d34"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosguard-darwin-arm64"
        sha256 "55d0fe9983d79d09d3645dee1b1211cbbc1fbc2fc2be7eab1d28d92ff929aaab"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/agent-terminal-darwin-arm64"
        sha256 "422685c033413e01e5b8f6934961111e09834621023e70e8ed08b50d540ff3f1"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosterm-darwin-arm64"
        sha256 "422685c033413e01e5b8f6934961111e09834621023e70e8ed08b50d540ff3f1"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aos-linux-amd64"
      sha256 "4f00a8a9b83bbce25ed263388e40c8cd99c4fd8f7f22878e19ffacb678e0fffb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aoscompose-linux-amd64"
        sha256 "4f00a8a9b83bbce25ed263388e40c8cd99c4fd8f7f22878e19ffacb678e0fffb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosward-linux-amd64"
        sha256 "4f00a8a9b83bbce25ed263388e40c8cd99c4fd8f7f22878e19ffacb678e0fffb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosguard-linux-amd64"
        sha256 "8daf28d8139812c38ff5e4332b0321d76188fe5f1e8f1e55f28dba0bfe7760cd"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/agent-terminal-linux-amd64"
        sha256 "7c4c18eaf7c19a4604bd88f9d909c38560ee572e118ee079fa7f133b318b53eb"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosterm-linux-amd64"
        sha256 "7c4c18eaf7c19a4604bd88f9d909c38560ee572e118ee079fa7f133b318b53eb"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aos-linux-arm64"
      sha256 "a76a728b75439736bfb54d110de667dabb80fa698cbbf540797632fc71f444c7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aoscompose-linux-arm64"
        sha256 "a76a728b75439736bfb54d110de667dabb80fa698cbbf540797632fc71f444c7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosward-linux-arm64"
        sha256 "a76a728b75439736bfb54d110de667dabb80fa698cbbf540797632fc71f444c7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosguard-linux-arm64"
        sha256 "1b9dc0b32dbfc7c6aab3cab17bff7d0f1d12c30dcbe7ea7d5ab61b17893ab0d1"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/agent-terminal-linux-arm64"
        sha256 "d8fe409e125d4145470aec8a8bd98f42d0bd37e09125adaf578563c51c995815"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.172.0/aosterm-linux-arm64"
        sha256 "d8fe409e125d4145470aec8a8bd98f42d0bd37e09125adaf578563c51c995815"
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
