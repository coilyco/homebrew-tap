class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.515.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aos-darwin-arm64"
    sha256 "d5c9b96a7bfa7c37c7ebba4a72190689c06ca66145e8f274caf51d87c0804d10"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aoscompose-darwin-arm64"
      sha256 "d5c9b96a7bfa7c37c7ebba4a72190689c06ca66145e8f274caf51d87c0804d10"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aosguard-darwin-arm64"
      sha256 "60186123667762e450c7a00c7bf2169451f9f8626af898635786bddb685a4ba5"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aterm-darwin-arm64"
      sha256 "b40ebe00bdc7d4c2f6411728664768db431bc43d36da1cd2b959a0f41a83f494"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aos-linux-amd64"
      sha256 "dce984dac1c7387ded493282fa2b505be32cd14d8a0eeca69f9973552f034228"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aoscompose-linux-amd64"
        sha256 "dce984dac1c7387ded493282fa2b505be32cd14d8a0eeca69f9973552f034228"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aosguard-linux-amd64"
        sha256 "6ca1776df4e60dfe90adc5e25a46df41a968e995e948c8dbd2d8c2de6344ae06"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aterm-linux-amd64"
        sha256 "6682354278d3542399e886da8c07dca303afa8ddf2b28ba88d71a631ec2e5bae"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aos-linux-arm64"
      sha256 "df47efcc85e33a13af4feb5f55f52d250c3d4e981c6717b7992c36b0baccd0ad"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aoscompose-linux-arm64"
        sha256 "df47efcc85e33a13af4feb5f55f52d250c3d4e981c6717b7992c36b0baccd0ad"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aosguard-linux-arm64"
        sha256 "5d842fb626ee2a4d4bb41c0bb56bc54b7cf64a0b42a17afc098ba18695dbc89f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.515.0/aterm-linux-arm64"
        sha256 "6b0ecaf70b183b8446601da3a4c775fad96f290af111def2685561542b6568ec"
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
