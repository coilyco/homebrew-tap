class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.462.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aos-darwin-arm64"
      sha256 "3edea4ff09fc6488ed1d001102371bbebd17cb3d6c7f870a6f1e7f58620194ae"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aoscompose-darwin-arm64"
        sha256 "3edea4ff09fc6488ed1d001102371bbebd17cb3d6c7f870a6f1e7f58620194ae"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aosward-darwin-arm64"
        sha256 "3edea4ff09fc6488ed1d001102371bbebd17cb3d6c7f870a6f1e7f58620194ae"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aosguard-darwin-arm64"
        sha256 "0dc9351976216f1c7f992db0ab0a399800cc73cde44635619bae061db7caa381"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aterm-darwin-arm64"
        sha256 "5011d7145893bea5dcd2c75c7f58384ae75b4fa97dc8ccb4813214a75e6c8e4f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aos-linux-amd64"
      sha256 "1452c2c37a88592ca29354711f82ece1ef90f351d73d95ec7a05d44070b4b371"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aoscompose-linux-amd64"
        sha256 "1452c2c37a88592ca29354711f82ece1ef90f351d73d95ec7a05d44070b4b371"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aosward-linux-amd64"
        sha256 "1452c2c37a88592ca29354711f82ece1ef90f351d73d95ec7a05d44070b4b371"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aosguard-linux-amd64"
        sha256 "c7babab6f061e2ac991c7173986995bc5b0f65b78e998e99005673fdb5c56714"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aterm-linux-amd64"
        sha256 "a9ccf3d13a715eb0d0d97b636e836d229635ab8b7b3ad5a73c395785c1f031ac"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aos-linux-arm64"
      sha256 "3fd360a473fc3e8545156460c19d370ce8da08a7607d093b4c520cd9c4c5a97a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aoscompose-linux-arm64"
        sha256 "3fd360a473fc3e8545156460c19d370ce8da08a7607d093b4c520cd9c4c5a97a"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aosward-linux-arm64"
        sha256 "3fd360a473fc3e8545156460c19d370ce8da08a7607d093b4c520cd9c4c5a97a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aosguard-linux-arm64"
        sha256 "6cc27ff85114fc4fe8e8b968dd1dfdd56f4685bfe49f5015d360a0edeb96b981"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.462.0/aterm-linux-arm64"
        sha256 "1f7dd7c6daf9d212c0bbb41a7a08e1782db3a5e71bdf8b76fc91fbd43d9fd4bc"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
