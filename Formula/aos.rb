class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.292.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aos-darwin-arm64"
      sha256 "ccc4693580256a77708a407c608e78ddc8639952ecb6b853bed0b4aaec5a9a9e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aoscompose-darwin-arm64"
        sha256 "ccc4693580256a77708a407c608e78ddc8639952ecb6b853bed0b4aaec5a9a9e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aosward-darwin-arm64"
        sha256 "ccc4693580256a77708a407c608e78ddc8639952ecb6b853bed0b4aaec5a9a9e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aosguard-darwin-arm64"
        sha256 "6bcf3b0d14ca389b6900193b40988beb1287d1920b4a08d0e79c038a0e08eb0e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aterm-darwin-arm64"
        sha256 "dff8a962fe416affe1706b401b63181a5e291b7146593695d14d7f18ca82ae6c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aos-linux-amd64"
      sha256 "60e58d7dc5806bf5a042d33844b440d79610c026cbadb06ff0dca10a64734b19"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aoscompose-linux-amd64"
        sha256 "60e58d7dc5806bf5a042d33844b440d79610c026cbadb06ff0dca10a64734b19"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aosward-linux-amd64"
        sha256 "60e58d7dc5806bf5a042d33844b440d79610c026cbadb06ff0dca10a64734b19"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aosguard-linux-amd64"
        sha256 "7ed3b2b89c20645f37082708f6cbdb68ad6f4946866307912061eafe631dcf45"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aterm-linux-amd64"
        sha256 "0cae036d0e7997671bae15672f5b4f4bf92447ef84075c9d42877d16cec4aafd"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aos-linux-arm64"
      sha256 "8262e7986c5122e3610ab2a91ec8ac815db2da0997e9bf2b83923bdaf13c54f7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aoscompose-linux-arm64"
        sha256 "8262e7986c5122e3610ab2a91ec8ac815db2da0997e9bf2b83923bdaf13c54f7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aosward-linux-arm64"
        sha256 "8262e7986c5122e3610ab2a91ec8ac815db2da0997e9bf2b83923bdaf13c54f7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aosguard-linux-arm64"
        sha256 "263cbe818fc736dfbdcbf41074cfe603f6f9482a440a625641d9ca8bf647413d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.292.0/aterm-linux-arm64"
        sha256 "4b3f145184d51088ce699f2b8bcc43582a4695f3bfe8cc11e61606cf92f395db"
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
