class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.469.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aos-darwin-arm64"
      sha256 "e594ec8e482770cf932173f7d6bde070a2b90bf33f5ee72e3ae334b6972c4dd0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aoscompose-darwin-arm64"
        sha256 "e594ec8e482770cf932173f7d6bde070a2b90bf33f5ee72e3ae334b6972c4dd0"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aosward-darwin-arm64"
        sha256 "e594ec8e482770cf932173f7d6bde070a2b90bf33f5ee72e3ae334b6972c4dd0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aosguard-darwin-arm64"
        sha256 "2b2aba78c9ca1b010f5c3ddaae6b765b7bf8ff7abf35b0092039c6a0ef4ad511"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aterm-darwin-arm64"
        sha256 "ba6a2b21dffb97b6e286aa33cee4a37f454981eab9a550fcd508896fbfe9fc23"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aos-linux-amd64"
      sha256 "e6a9723bd1f87cc0b0dda66ea6131130b6943b0a6fba8922a797676a6cc7c28d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aoscompose-linux-amd64"
        sha256 "e6a9723bd1f87cc0b0dda66ea6131130b6943b0a6fba8922a797676a6cc7c28d"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aosward-linux-amd64"
        sha256 "e6a9723bd1f87cc0b0dda66ea6131130b6943b0a6fba8922a797676a6cc7c28d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aosguard-linux-amd64"
        sha256 "a2802c18c32c9386618d2bcca48e693d4e65b98747302928079e5fe7dbcb8845"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aterm-linux-amd64"
        sha256 "752b1247250e42ba76648782fdad7713f576e76a75dc64927fdb396d42e2ef69"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aos-linux-arm64"
      sha256 "cf09d679752b2fe8ee2666dd0e4485ca15ea97396101f63d07b8fc666e04c2e1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aoscompose-linux-arm64"
        sha256 "cf09d679752b2fe8ee2666dd0e4485ca15ea97396101f63d07b8fc666e04c2e1"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aosward-linux-arm64"
        sha256 "cf09d679752b2fe8ee2666dd0e4485ca15ea97396101f63d07b8fc666e04c2e1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aosguard-linux-arm64"
        sha256 "1fbe5f24c4f9a35aed4bd35b9846bbed4e46935f849ad7dc62496b1d54234356"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.469.0/aterm-linux-arm64"
        sha256 "393a3cf5443eed8e12a7f927898a4b31a1f954f971d9edd63be3d3497f367577"
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
