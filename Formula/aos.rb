class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.438.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aos-darwin-arm64"
      sha256 "43af95ebfd2b2e9a7e68c12e335d47d79dc241a2e26722c917affd80ebc1d6c5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aoscompose-darwin-arm64"
        sha256 "43af95ebfd2b2e9a7e68c12e335d47d79dc241a2e26722c917affd80ebc1d6c5"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aosward-darwin-arm64"
        sha256 "43af95ebfd2b2e9a7e68c12e335d47d79dc241a2e26722c917affd80ebc1d6c5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aosguard-darwin-arm64"
        sha256 "0cd687c0dd0a84c0a2e0c7851ecaaab95b460b7a0974dd391650fc31bfb6abde"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aterm-darwin-arm64"
        sha256 "2c8e643c060a8da857605f09adfb004c0a69eefb7544170a896b989c687b76eb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aos-linux-amd64"
      sha256 "7feb40ec03d89fd3333afcd34914bf3c0a5f30edad48b11cd2abd2461273c3b2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aoscompose-linux-amd64"
        sha256 "7feb40ec03d89fd3333afcd34914bf3c0a5f30edad48b11cd2abd2461273c3b2"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aosward-linux-amd64"
        sha256 "7feb40ec03d89fd3333afcd34914bf3c0a5f30edad48b11cd2abd2461273c3b2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aosguard-linux-amd64"
        sha256 "6e6fef8350e348ae14a79402e7453fcba6e18e125c4b2ae80da13abb8d06a78e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aterm-linux-amd64"
        sha256 "120a981b476b98a74afe39b32361df6ed926e5bcc5137a0c8d2a66c1f16006c8"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aos-linux-arm64"
      sha256 "1c31e3f9f63c80e1adc4c9060f483b8f94221a60fdff8388ee83b8213758f2cc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aoscompose-linux-arm64"
        sha256 "1c31e3f9f63c80e1adc4c9060f483b8f94221a60fdff8388ee83b8213758f2cc"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aosward-linux-arm64"
        sha256 "1c31e3f9f63c80e1adc4c9060f483b8f94221a60fdff8388ee83b8213758f2cc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aosguard-linux-arm64"
        sha256 "a54310a8f0237c11b1a68d534ed463556e6c5d74940c40b5af3263792384ac1c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.438.0/aterm-linux-arm64"
        sha256 "e4e5fabd9043e578a8fbffabea2a719886bfb0df7920b19cf7304111d2e2a18d"
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
