class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.433.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aos-darwin-arm64"
      sha256 "5e16627af12d16bd82ec77b53d3229e2a77fd55a95ebbca5f697b01178146296"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aoscompose-darwin-arm64"
        sha256 "5e16627af12d16bd82ec77b53d3229e2a77fd55a95ebbca5f697b01178146296"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aosward-darwin-arm64"
        sha256 "5e16627af12d16bd82ec77b53d3229e2a77fd55a95ebbca5f697b01178146296"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aosguard-darwin-arm64"
        sha256 "ef614278f3c3ec575e324e4fd812be13eb8ab22bd2b13a3374e380a91018aa35"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aterm-darwin-arm64"
        sha256 "6d7854a2dbf48f91bf9a0a5ec336d401b0e66af1b5f78c1153076a8ac14f9cc5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aos-linux-amd64"
      sha256 "0a59d7ae9e10b5d16dc41f66c78299dd7d3eb1ba68f5fba1ed6732581e550bc6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aoscompose-linux-amd64"
        sha256 "0a59d7ae9e10b5d16dc41f66c78299dd7d3eb1ba68f5fba1ed6732581e550bc6"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aosward-linux-amd64"
        sha256 "0a59d7ae9e10b5d16dc41f66c78299dd7d3eb1ba68f5fba1ed6732581e550bc6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aosguard-linux-amd64"
        sha256 "4cef925c89cc51b7503777c650fe9cf9ad92e820e70c32ca6facae39e37aeb7c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aterm-linux-amd64"
        sha256 "9f7e4f06d2b03d2988ae7fe7007a67d488369053e7066a789eec9c4e7289a5df"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aos-linux-arm64"
      sha256 "1582d26fa656399fea982801e4e66c86ed0e9d4b66e6f86213eaa9d3a4dc10d4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aoscompose-linux-arm64"
        sha256 "1582d26fa656399fea982801e4e66c86ed0e9d4b66e6f86213eaa9d3a4dc10d4"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aosward-linux-arm64"
        sha256 "1582d26fa656399fea982801e4e66c86ed0e9d4b66e6f86213eaa9d3a4dc10d4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aosguard-linux-arm64"
        sha256 "72a9d4362c668eebb83d749455317f29f24e8d59bc6bfd002711f228a1ce8f9c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.433.0/aterm-linux-arm64"
        sha256 "8bb3003f270bf4b6a3edeedd20b5c84662b63ec0dbc09d10598b75a7bbd2001e"
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
