class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.367.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aos-darwin-arm64"
      sha256 "c26f174a935fcf3df1cb64d9064e93438a8df839feb71a02d6e6ec3e798f89d2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aoscompose-darwin-arm64"
        sha256 "c26f174a935fcf3df1cb64d9064e93438a8df839feb71a02d6e6ec3e798f89d2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aosward-darwin-arm64"
        sha256 "c26f174a935fcf3df1cb64d9064e93438a8df839feb71a02d6e6ec3e798f89d2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aosguard-darwin-arm64"
        sha256 "fec946329efa3f66535ed07f74d2aa04e90846a0463460c3f03caa185b54cc81"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aterm-darwin-arm64"
        sha256 "f0c7819931df0583ee344f540eeebdf29a854979f99f7a61cfaaff5fe3c5d9e4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aos-linux-amd64"
      sha256 "a7e5211601a3dc4a36bc8adaaa3d8b9bfc655c2e6130cfdd2b9a391ad2bc8eb2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aoscompose-linux-amd64"
        sha256 "a7e5211601a3dc4a36bc8adaaa3d8b9bfc655c2e6130cfdd2b9a391ad2bc8eb2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aosward-linux-amd64"
        sha256 "a7e5211601a3dc4a36bc8adaaa3d8b9bfc655c2e6130cfdd2b9a391ad2bc8eb2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aosguard-linux-amd64"
        sha256 "9fc200ca283ed7288caf6e02e6fab1c38f6d1f9f395bbc27afcdb4a2bcd2b703"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aterm-linux-amd64"
        sha256 "2e1cd44bea560513480d777d1b4b8c9126ee2361b61f8114f8f937b3f4a10f36"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aos-linux-arm64"
      sha256 "2d3a7224f8302ef7901599e690448e0b01750ee861b5c19a053a62b14226687a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aoscompose-linux-arm64"
        sha256 "2d3a7224f8302ef7901599e690448e0b01750ee861b5c19a053a62b14226687a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aosward-linux-arm64"
        sha256 "2d3a7224f8302ef7901599e690448e0b01750ee861b5c19a053a62b14226687a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aosguard-linux-arm64"
        sha256 "6487c8d659c803a3486b0530929377b4722c31d4019ddf8aa445f1771d206c9d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.367.0/aterm-linux-arm64"
        sha256 "f80711ec737739f63b940bf6170013cad480128941e95279dc9109d085d0466f"
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
