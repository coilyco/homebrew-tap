class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.387.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aos-darwin-arm64"
      sha256 "87913158127de005c23d58cdde709aa04d2e8e1e7ecd0daab886ff37b1637996"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aoscompose-darwin-arm64"
        sha256 "87913158127de005c23d58cdde709aa04d2e8e1e7ecd0daab886ff37b1637996"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aosward-darwin-arm64"
        sha256 "87913158127de005c23d58cdde709aa04d2e8e1e7ecd0daab886ff37b1637996"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aosguard-darwin-arm64"
        sha256 "4cdcf831657eee5873f76179ed9c62e74507593d2d8f52bc6908e32f6882208e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aterm-darwin-arm64"
        sha256 "2afe4e7e4c0d77b1070196d908523e0fa3f5f48964f2e6c284da7a6c65c56394"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aos-linux-amd64"
      sha256 "0a5803e90502af4144fd9a2bfb037b87be4ede6eb1af990fa62f0c5f77765404"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aoscompose-linux-amd64"
        sha256 "0a5803e90502af4144fd9a2bfb037b87be4ede6eb1af990fa62f0c5f77765404"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aosward-linux-amd64"
        sha256 "0a5803e90502af4144fd9a2bfb037b87be4ede6eb1af990fa62f0c5f77765404"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aosguard-linux-amd64"
        sha256 "7e4224a915f5a978e53eecb01f3f0b2cb0c2f23922f3fb5bc2428f896067e577"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aterm-linux-amd64"
        sha256 "c93bf87ee6bc55efa43ae11f9acd0a86cd53c6dc13d3171c6a4cdb196511379c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aos-linux-arm64"
      sha256 "8fe249cf64886dcbcdf35e5bd7a9e34efed2c4c5d3153d84035d0360e25ba65c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aoscompose-linux-arm64"
        sha256 "8fe249cf64886dcbcdf35e5bd7a9e34efed2c4c5d3153d84035d0360e25ba65c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aosward-linux-arm64"
        sha256 "8fe249cf64886dcbcdf35e5bd7a9e34efed2c4c5d3153d84035d0360e25ba65c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aosguard-linux-arm64"
        sha256 "65e5d8c2aa2e9c8cf83495dadb65bb535003ecf836be28c8782146c4b116285c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.387.0/aterm-linux-arm64"
        sha256 "01d51a9d423301dca10dec16c05c5187b28fefdc134146afd4e3ab0ecbe4ddb5"
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
