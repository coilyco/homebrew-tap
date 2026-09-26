class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.394.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aos-darwin-arm64"
      sha256 "8d2f838f1a067afb29f16144b88200daabcbf21eb7b0a13cd06986846d6d19ba"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aoscompose-darwin-arm64"
        sha256 "8d2f838f1a067afb29f16144b88200daabcbf21eb7b0a13cd06986846d6d19ba"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aosward-darwin-arm64"
        sha256 "8d2f838f1a067afb29f16144b88200daabcbf21eb7b0a13cd06986846d6d19ba"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aosguard-darwin-arm64"
        sha256 "eff82a64538f2eb12a9ef992cba8d370a1f290169387e5e8017a870a8d266ded"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aterm-darwin-arm64"
        sha256 "0e331d198b3934b0607cbdfd57b7882193aa4a1d205428abcb89be088b745354"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aos-linux-amd64"
      sha256 "de8c463db5e8f3835538c17ef8064a284a1027bc1f9157f35695af288b3bcb5a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aoscompose-linux-amd64"
        sha256 "de8c463db5e8f3835538c17ef8064a284a1027bc1f9157f35695af288b3bcb5a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aosward-linux-amd64"
        sha256 "de8c463db5e8f3835538c17ef8064a284a1027bc1f9157f35695af288b3bcb5a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aosguard-linux-amd64"
        sha256 "7d0f205c73f34aed56a664927e4740864972f9cabeaf299fabf063ef2c8d9a30"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aterm-linux-amd64"
        sha256 "9b2dd8337f91c759f8dcb547b39c87e58af40813371a21d5eb9f1fa2da63866c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aos-linux-arm64"
      sha256 "22829829511588aa692b4612bb799d8de9ff54374efd3c2985ed77f7f32336a5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aoscompose-linux-arm64"
        sha256 "22829829511588aa692b4612bb799d8de9ff54374efd3c2985ed77f7f32336a5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aosward-linux-arm64"
        sha256 "22829829511588aa692b4612bb799d8de9ff54374efd3c2985ed77f7f32336a5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aosguard-linux-arm64"
        sha256 "47c76d62d88980c7e7552a15b6bf420447e98d7e078fd702b39be09b5c09296d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.394.0/aterm-linux-arm64"
        sha256 "d216925f09597fcc24f6dfe27f6791d9a1de8e1d5ec72db6dfc7e2f5c4a48dbc"
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
