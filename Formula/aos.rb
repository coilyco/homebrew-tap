class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.443.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aos-darwin-arm64"
      sha256 "3261c3f439dde398f4ec29df747ab5a0e36cdcab39f4fff55827dab33a0ea912"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aoscompose-darwin-arm64"
        sha256 "3261c3f439dde398f4ec29df747ab5a0e36cdcab39f4fff55827dab33a0ea912"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aosward-darwin-arm64"
        sha256 "3261c3f439dde398f4ec29df747ab5a0e36cdcab39f4fff55827dab33a0ea912"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aosguard-darwin-arm64"
        sha256 "79ed210b77c80a96cc8a8c62de08394e6786249c737c8cf43bcce9659f2b2c7f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aterm-darwin-arm64"
        sha256 "86c1630958c81370e2692ce846d905db6db7a29623662e2f242bd1a63147b768"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aos-linux-amd64"
      sha256 "a87aa562764d1d7d62a08b2790653f2c1013c69b5a3c8d7a5414c88429f2e92e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aoscompose-linux-amd64"
        sha256 "a87aa562764d1d7d62a08b2790653f2c1013c69b5a3c8d7a5414c88429f2e92e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aosward-linux-amd64"
        sha256 "a87aa562764d1d7d62a08b2790653f2c1013c69b5a3c8d7a5414c88429f2e92e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aosguard-linux-amd64"
        sha256 "f521e60a73a23ecf000b32b1a9c785a0df1c18d4d10549fe49dabaf5dc400a72"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aterm-linux-amd64"
        sha256 "925be8a1d2463c90e4dec43da2d5f5ec56e48200fc665ae8a1a10c684a1baf7c"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aos-linux-arm64"
      sha256 "87d9a0c6ae9813d7f8c2fadcd941d1f30bd5eb8064f127536b1a4ae7ccc1979f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aoscompose-linux-arm64"
        sha256 "87d9a0c6ae9813d7f8c2fadcd941d1f30bd5eb8064f127536b1a4ae7ccc1979f"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aosward-linux-arm64"
        sha256 "87d9a0c6ae9813d7f8c2fadcd941d1f30bd5eb8064f127536b1a4ae7ccc1979f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aosguard-linux-arm64"
        sha256 "1aec0c3a5115f0de9eddfc759e0512dad61499374b6e90910ff750dc7857b18e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.443.0/aterm-linux-arm64"
        sha256 "af567d3cb392ea573332f21f4cba2de83e198c17ae1eed11d0166cf57b351bbd"
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
