class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.467.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aos-darwin-arm64"
      sha256 "05db86896f51d6b1008caff9dd23f07814b1cafcbf3e48cb22bc960fa18241b8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aoscompose-darwin-arm64"
        sha256 "05db86896f51d6b1008caff9dd23f07814b1cafcbf3e48cb22bc960fa18241b8"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aosward-darwin-arm64"
        sha256 "05db86896f51d6b1008caff9dd23f07814b1cafcbf3e48cb22bc960fa18241b8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aosguard-darwin-arm64"
        sha256 "2ee19b184614ce9a6f6be4f85cc88363efc52ec5972886ad6553973babcc603b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aterm-darwin-arm64"
        sha256 "5aad582ce5711e44c01311d0e43928f02b54d3c78c91ae69927fc35dc019f9ac"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aos-linux-amd64"
      sha256 "e67992cf060b45a2e96d7467b00b71b7607136052ff44a03785ec063eac35947"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aoscompose-linux-amd64"
        sha256 "e67992cf060b45a2e96d7467b00b71b7607136052ff44a03785ec063eac35947"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aosward-linux-amd64"
        sha256 "e67992cf060b45a2e96d7467b00b71b7607136052ff44a03785ec063eac35947"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aosguard-linux-amd64"
        sha256 "f844da65585f5717472beac9e89968733917126f6ae9b76d744cc247dc201f54"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aterm-linux-amd64"
        sha256 "556b3922c22bff13db5c63f342b3210b2578f2c9c0c259b7aceac38bc9ee5bd8"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aos-linux-arm64"
      sha256 "e6504d59b80328e644c7e30142e3f495653e12b5d188517b5228dd7304781feb"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aoscompose-linux-arm64"
        sha256 "e6504d59b80328e644c7e30142e3f495653e12b5d188517b5228dd7304781feb"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aosward-linux-arm64"
        sha256 "e6504d59b80328e644c7e30142e3f495653e12b5d188517b5228dd7304781feb"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aosguard-linux-arm64"
        sha256 "af98ea9a2618640b7b9c6f1ae2dedffb4c3f0d84dc7e131df655cd7df751781b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.467.0/aterm-linux-arm64"
        sha256 "83a2851500902b7db7ed80df891b0d56e4ef88212f7c69cb04147916f9e5bf57"
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
