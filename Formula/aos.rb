class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.441.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aos-darwin-arm64"
      sha256 "b83a81fa201ae083bc3c928941990ab99cc1927252be537fbc2e1d5f41f92b9a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aoscompose-darwin-arm64"
        sha256 "b83a81fa201ae083bc3c928941990ab99cc1927252be537fbc2e1d5f41f92b9a"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aosward-darwin-arm64"
        sha256 "b83a81fa201ae083bc3c928941990ab99cc1927252be537fbc2e1d5f41f92b9a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aosguard-darwin-arm64"
        sha256 "1e7069e01f9cd2a68f06a543ae3ba2f8854f7494c40f0b53e3e1c322c8c4e9eb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aterm-darwin-arm64"
        sha256 "740542901f31b0dc099f04b40bf970fed166a91950aebdff986b243c99c8fe4d"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aos-linux-amd64"
      sha256 "4e44b22b04cde6d7c1686893d4fb912f6d6305e2e08209f4a2f9c66ae79196d4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aoscompose-linux-amd64"
        sha256 "4e44b22b04cde6d7c1686893d4fb912f6d6305e2e08209f4a2f9c66ae79196d4"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aosward-linux-amd64"
        sha256 "4e44b22b04cde6d7c1686893d4fb912f6d6305e2e08209f4a2f9c66ae79196d4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aosguard-linux-amd64"
        sha256 "a492f83ed6159a518f0a70e4daab6f5135b19394667f38b1fc795689e26e47c0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aterm-linux-amd64"
        sha256 "39e2e167655eff71d118e99da6dbb82aee59c516f361c31584377efda81c1434"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aos-linux-arm64"
      sha256 "76b2dd9ce92da5bf963873f67cb907c986936026cc1f57f75feb04cebf5eb188"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aoscompose-linux-arm64"
        sha256 "76b2dd9ce92da5bf963873f67cb907c986936026cc1f57f75feb04cebf5eb188"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aosward-linux-arm64"
        sha256 "76b2dd9ce92da5bf963873f67cb907c986936026cc1f57f75feb04cebf5eb188"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aosguard-linux-arm64"
        sha256 "bdf9e549ebfb4c1213dd01058f8264c8736c890fd4f4597d657bac7b731928e0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.441.0/aterm-linux-arm64"
        sha256 "f2f6466e30b3587fe3f9b9146d3ebb297d6317a187eef31fcfdc74dcbfff1c7a"
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
