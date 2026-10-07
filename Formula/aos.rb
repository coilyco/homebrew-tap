class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.440.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aos-darwin-arm64"
      sha256 "ce87330bd14bfbf29a9ad316cfbe150f783ac3a9b963bb3766062ccdd1d9d827"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aoscompose-darwin-arm64"
        sha256 "ce87330bd14bfbf29a9ad316cfbe150f783ac3a9b963bb3766062ccdd1d9d827"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aosward-darwin-arm64"
        sha256 "ce87330bd14bfbf29a9ad316cfbe150f783ac3a9b963bb3766062ccdd1d9d827"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aosguard-darwin-arm64"
        sha256 "06eed19c9e6f9804d962bb854d3682ad4fc3db102bba0aac8f985b523a4f4044"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aterm-darwin-arm64"
        sha256 "f3b4f3d2ea7e8f8b61a4566fbd7cfffe13ea45aa53eb788c978f61115804ed61"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aos-linux-amd64"
      sha256 "e3398c68e5878568f9c4d5cc77593ffbccb07d81851b7728e8293d247e84eb61"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aoscompose-linux-amd64"
        sha256 "e3398c68e5878568f9c4d5cc77593ffbccb07d81851b7728e8293d247e84eb61"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aosward-linux-amd64"
        sha256 "e3398c68e5878568f9c4d5cc77593ffbccb07d81851b7728e8293d247e84eb61"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aosguard-linux-amd64"
        sha256 "6141463cfbb350864a1191f340e8c5d3cedc4ab06ad7285cd4a63d49caa02f4d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aterm-linux-amd64"
        sha256 "2f907e7f657637f8a8b728f0f975c9aec06b688de7ee42c5b0ada38510725e19"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aos-linux-arm64"
      sha256 "94e2d4ed422cd603e06adee210c78c0751efca7b596602d0ae72f6996600fc6d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aoscompose-linux-arm64"
        sha256 "94e2d4ed422cd603e06adee210c78c0751efca7b596602d0ae72f6996600fc6d"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aosward-linux-arm64"
        sha256 "94e2d4ed422cd603e06adee210c78c0751efca7b596602d0ae72f6996600fc6d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aosguard-linux-arm64"
        sha256 "1b5ac939efae01c203ef326313f43d85d43764a1611776331d302583e8deae29"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.440.0/aterm-linux-arm64"
        sha256 "46a32cf0fdda1632f9ec08b3905fb21841fc30ba3146bc1ed1032dce0a35ae45"
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
