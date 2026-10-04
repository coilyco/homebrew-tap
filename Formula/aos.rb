class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.430.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aos-darwin-arm64"
      sha256 "dc659ebd7798dbd08c2044acfe4c4bf9f0705906c364ac571f0968d47a80bc86"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aoscompose-darwin-arm64"
        sha256 "dc659ebd7798dbd08c2044acfe4c4bf9f0705906c364ac571f0968d47a80bc86"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aosward-darwin-arm64"
        sha256 "dc659ebd7798dbd08c2044acfe4c4bf9f0705906c364ac571f0968d47a80bc86"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aosguard-darwin-arm64"
        sha256 "d4454c4ab408ebbbd3bdd80d3389755032ec335e0d1768292ef3afb4b9c80d85"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aterm-darwin-arm64"
        sha256 "e399542c0cd4ea218a81f29bee4ea43935ec77ffdc0e7bc696ccaadcadbcef2c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aos-linux-amd64"
      sha256 "152560a58b6f65255c4acfb1c848e371a713585213953dd708d950ecaad74d22"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aoscompose-linux-amd64"
        sha256 "152560a58b6f65255c4acfb1c848e371a713585213953dd708d950ecaad74d22"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aosward-linux-amd64"
        sha256 "152560a58b6f65255c4acfb1c848e371a713585213953dd708d950ecaad74d22"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aosguard-linux-amd64"
        sha256 "21eba8b70696b66396376acfb05d15dcaa053e2f1721e016f07a78065b0fb62e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aterm-linux-amd64"
        sha256 "e5f04ff4297bd53978a7b6d7affd1dfa0beec12ba2a076e241d2966fc46cb986"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aos-linux-arm64"
      sha256 "3eddf92c6f17dfa2bba6d6d2db02f987f4d479ddf664f728e0c0481b8fe7f5d3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aoscompose-linux-arm64"
        sha256 "3eddf92c6f17dfa2bba6d6d2db02f987f4d479ddf664f728e0c0481b8fe7f5d3"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aosward-linux-arm64"
        sha256 "3eddf92c6f17dfa2bba6d6d2db02f987f4d479ddf664f728e0c0481b8fe7f5d3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aosguard-linux-arm64"
        sha256 "8bb385fc4329ff72c81400fd3adb3b7bd2fe1495c4fc78c79f250ef252180738"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.430.0/aterm-linux-arm64"
        sha256 "88a91ebd134d054b9eca72a8d3cb0736489cc72ddb9a21a2b3d8ad9e3c8eaa63"
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
