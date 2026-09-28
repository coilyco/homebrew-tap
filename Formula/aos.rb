class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.397.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aos-darwin-arm64"
      sha256 "ae8412a67e765f790426af6cf8b77ba0ad1fe5810a97cd011112dac7e8cf70d3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aoscompose-darwin-arm64"
        sha256 "ae8412a67e765f790426af6cf8b77ba0ad1fe5810a97cd011112dac7e8cf70d3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aosward-darwin-arm64"
        sha256 "ae8412a67e765f790426af6cf8b77ba0ad1fe5810a97cd011112dac7e8cf70d3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aosguard-darwin-arm64"
        sha256 "c8f4de00b592da7f242ce5479501d1a6d7bc71f9db53219eef9997e29fac10e7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aterm-darwin-arm64"
        sha256 "88fac10e1579eef7bb8a5d06465dafcbb59f61b74a1e22041250c06933177dbe"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aos-linux-amd64"
      sha256 "e187c8b7becd0cf2acac9477b86b3cd46b46637632bac04c683d413004bba386"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aoscompose-linux-amd64"
        sha256 "e187c8b7becd0cf2acac9477b86b3cd46b46637632bac04c683d413004bba386"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aosward-linux-amd64"
        sha256 "e187c8b7becd0cf2acac9477b86b3cd46b46637632bac04c683d413004bba386"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aosguard-linux-amd64"
        sha256 "5493a298e8e7a8a8a8eb4b64f2bfd05ef386e57e8b2576f6265503d80be3fb1b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aterm-linux-amd64"
        sha256 "53a0586c6a574277ed62da9e4a9596643b90acf4cba5042b2a101116dc738a96"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aos-linux-arm64"
      sha256 "8d196356c51149a0f9ac550788ba70ce0d902dd32d53a59d5554ecff703a9b3f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aoscompose-linux-arm64"
        sha256 "8d196356c51149a0f9ac550788ba70ce0d902dd32d53a59d5554ecff703a9b3f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aosward-linux-arm64"
        sha256 "8d196356c51149a0f9ac550788ba70ce0d902dd32d53a59d5554ecff703a9b3f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aosguard-linux-arm64"
        sha256 "d7a84c9b563a6e55270f7b128e7bebf3ba13a0ffa9314c4fccb587281bd7e5e1"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.397.0/aterm-linux-arm64"
        sha256 "9c4c6ccaa7d961b68b3f92cfb961b75b35977d272e16d1664765fb3544d6dc2c"
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
