class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.476.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aos-darwin-arm64"
      sha256 "4d964d4081746c5259955c7a4d4efc4873341915ea40ce3c8fcea1f6235d0ff7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aoscompose-darwin-arm64"
        sha256 "4d964d4081746c5259955c7a4d4efc4873341915ea40ce3c8fcea1f6235d0ff7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aosguard-darwin-arm64"
        sha256 "042c571af26a5749c2044a01047a67221ad086f048508df1cc7e09e91c97f151"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aterm-darwin-arm64"
        sha256 "4bdf9e8ab997b3cf1ab21f942e0a1623fa2ba35f91b54b5e2f793cbfc0454797"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aos-linux-amd64"
      sha256 "ac83ba788c069aa27fbed5b0838cc7fabcfbb157f8ef4a28411c4f65962402e3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aoscompose-linux-amd64"
        sha256 "ac83ba788c069aa27fbed5b0838cc7fabcfbb157f8ef4a28411c4f65962402e3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aosguard-linux-amd64"
        sha256 "ee3451a47ebb2fefcf2c911e0d2e90ecaebfcde4508d94d730a78e970c3e40cf"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aterm-linux-amd64"
        sha256 "19c1967e56b5f976dbbd29b0d98bd0c3643cada6147567347d593d14497b3d9a"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aos-linux-arm64"
      sha256 "ece43a57b24ebfde81fbe291295caa373d0d784d876008698dbf0787ccea5a5e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aoscompose-linux-arm64"
        sha256 "ece43a57b24ebfde81fbe291295caa373d0d784d876008698dbf0787ccea5a5e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aosguard-linux-arm64"
        sha256 "8c51ab71b92f25545adb20492a7b4c83991616dff8b22813c5c010d19935ab6d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.476.0/aterm-linux-arm64"
        sha256 "e233d2adf4b04a593cf184bda24b8f88056c85ba48f3922aa975e43b3eb01a6d"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
