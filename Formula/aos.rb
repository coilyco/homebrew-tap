class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.434.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aos-darwin-arm64"
      sha256 "2a1d3efef2c6b0c6ab6099583f0aeda31237c44c6edd1d8afd984783ae43d1e1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aoscompose-darwin-arm64"
        sha256 "2a1d3efef2c6b0c6ab6099583f0aeda31237c44c6edd1d8afd984783ae43d1e1"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aosward-darwin-arm64"
        sha256 "2a1d3efef2c6b0c6ab6099583f0aeda31237c44c6edd1d8afd984783ae43d1e1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aosguard-darwin-arm64"
        sha256 "5410b1deffd79b7e6b7dec912abf3e5873f7699985194033fdfb234e378bd140"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aterm-darwin-arm64"
        sha256 "866650829caeb02c9959461bf79378a20d6f0fbd4429073737f318e1656550aa"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aos-linux-amd64"
      sha256 "3c7ec233cd71a4e38b265c848ccb2cbc5ae009d45ed1b99abfa5a1bc19743dc9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aoscompose-linux-amd64"
        sha256 "3c7ec233cd71a4e38b265c848ccb2cbc5ae009d45ed1b99abfa5a1bc19743dc9"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aosward-linux-amd64"
        sha256 "3c7ec233cd71a4e38b265c848ccb2cbc5ae009d45ed1b99abfa5a1bc19743dc9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aosguard-linux-amd64"
        sha256 "dedd00864aff8065e71b4815dee02c669ffe6811bde2570fd3f5f2f29af191a4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aterm-linux-amd64"
        sha256 "f9204779fadc65aabc750df7c95932c7e384350e124eab3649b202afc5f29cf6"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aos-linux-arm64"
      sha256 "8be7ca24b5cf2b567b760626ce692939771f4370c0dabb800478472ea5644aed"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aoscompose-linux-arm64"
        sha256 "8be7ca24b5cf2b567b760626ce692939771f4370c0dabb800478472ea5644aed"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aosward-linux-arm64"
        sha256 "8be7ca24b5cf2b567b760626ce692939771f4370c0dabb800478472ea5644aed"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aosguard-linux-arm64"
        sha256 "39bea297873e52ea4665370cfced4e1426dd7a884864d8780a0228f05c598cb3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.434.0/aterm-linux-arm64"
        sha256 "15fd90163de0cf3305ee4dcb0428cddbba5aee52b603431124e76777cf9b4c80"
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
