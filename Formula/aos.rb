class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.481.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aos-darwin-arm64"
      sha256 "0f0115ee1f969430d7ad7d7b0859a8ef5cd477ec0fd50cd939de6c3905d98e0e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aoscompose-darwin-arm64"
        sha256 "0f0115ee1f969430d7ad7d7b0859a8ef5cd477ec0fd50cd939de6c3905d98e0e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aosguard-darwin-arm64"
        sha256 "fa3e6a6b5d9c8148c8a6e9cd52409cf2ee4f9c0002b7d2eb7ad39bad110bed3e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aterm-darwin-arm64"
        sha256 "425b6e6bfc9bd4ffa7f634415044dbb88718b15b62736c27617cf7096d1b1adf"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aos-linux-amd64"
      sha256 "389f94cf5a107ca586ae0e4ffae74a99aa6e698f70c978589103fd6907b2cca4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aoscompose-linux-amd64"
        sha256 "389f94cf5a107ca586ae0e4ffae74a99aa6e698f70c978589103fd6907b2cca4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aosguard-linux-amd64"
        sha256 "46d250f540dc754679647da3860215cf8c375aacdf7e8349cbb4107e95ee8db7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aterm-linux-amd64"
        sha256 "0e6095f727914c6f7c03c4ebd9ce91a2b359be329b98daf0246d4577a575a92e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aos-linux-arm64"
      sha256 "cce7b1209ead3fc5b22aa9c26bdacb4ef2c5438448c035fd57a1c26955335434"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aoscompose-linux-arm64"
        sha256 "cce7b1209ead3fc5b22aa9c26bdacb4ef2c5438448c035fd57a1c26955335434"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aosguard-linux-arm64"
        sha256 "a45cfa22098fdb239f654bde3ec7d11fd75e44de4c7dcc379135d970ae565d4c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.481.0/aterm-linux-arm64"
        sha256 "53461a45187ecd19a98d69032b0e56f226173dcf5058c58b9e24a14a749b1772"
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
