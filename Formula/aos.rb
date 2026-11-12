class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.617.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aos-darwin-arm64"
    sha256 "396a846a0a3f5c62a9fdca673f7e01eb7c91196d8fce86f18017e481fcbd9ed2"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aoscompose-darwin-arm64"
      sha256 "396a846a0a3f5c62a9fdca673f7e01eb7c91196d8fce86f18017e481fcbd9ed2"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aosguard-darwin-arm64"
      sha256 "d5033750dca8434f84d1f6f1094f5d03ff04e69aae87fc65510ed0b28f08cbfe"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "4f29dbd2b0e0d732a5d5e4c555ed31ae0834e20a37a2c767bb1040792874ef83"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aos-linux-amd64"
      sha256 "c6e888bf41f408fc60eb797af48be17d25f99a234e9c2dc0fad963bd789f6ae5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aoscompose-linux-amd64"
        sha256 "c6e888bf41f408fc60eb797af48be17d25f99a234e9c2dc0fad963bd789f6ae5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aosguard-linux-amd64"
        sha256 "c2b5a2295078e96cdc2b6355594bdd60fc8802c421180269290c746c4ffa1f9a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aterm-linux-amd64"
        sha256 "349a4d80c6b322cd7af1bdea1f8f069c1c6c872fd2ae15564c913fe12aa44172"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aos-linux-arm64"
      sha256 "978ea4024398078ed21ab40ead1637ecafd69eb800b4bfc6dbd3bd7f8086bb4d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aoscompose-linux-arm64"
        sha256 "978ea4024398078ed21ab40ead1637ecafd69eb800b4bfc6dbd3bd7f8086bb4d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aosguard-linux-arm64"
        sha256 "6f1314ed2912ffc0cb9b34c54a296881505ae11507fd3f7225b85e801aee1b90"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.617.0/aterm-linux-arm64"
        sha256 "95cec0b7e024cbf5fb00d426c283722c5639f23f8a56a9f3cd1d5e7248d409e2"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    # macOS installs the signed bundle, whole (:nounzip) because a stage would
    # step into it, and links bin/aterm to its executable. See docs/aos-cli.md.
    if OS.mac?
      resource("aterm").stage do
        system "tar", "-xzf", Dir["*.tar.gz"].first, "-C", prefix
      end
      bin.install_symlink prefix/"Treehouse.app/Contents/MacOS/aterm"
    else
      resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
