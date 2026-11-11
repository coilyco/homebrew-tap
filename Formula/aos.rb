class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.613.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aos-darwin-arm64"
    sha256 "e1586f0fb23f9d64f1dbd37cc6ba8432ec114c3d771d9b07b8ac03acf9a1ba5c"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aoscompose-darwin-arm64"
      sha256 "e1586f0fb23f9d64f1dbd37cc6ba8432ec114c3d771d9b07b8ac03acf9a1ba5c"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aosguard-darwin-arm64"
      sha256 "3803b1787270c0a9a35e873042853e5523a751330f1c2f8d5091e51cb7cf2d06"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "4a3840bde2a82d97233789e629ec9333cdaead44e906f8b31f32e86ba5394e29"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aos-linux-amd64"
      sha256 "94875cea573a1f5659aced0d532e7a07df7b92142c2a6c593f72c0613b4f2ebe"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aoscompose-linux-amd64"
        sha256 "94875cea573a1f5659aced0d532e7a07df7b92142c2a6c593f72c0613b4f2ebe"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aosguard-linux-amd64"
        sha256 "ba76add61f5aa421744625aab1e8b94a5236bfef361ffd0cc3368bee1d14cd20"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aterm-linux-amd64"
        sha256 "f7b9832c5c4b028cdccdce8d41dd051780988dcb09fe87c402852e90f750bf85"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aos-linux-arm64"
      sha256 "752b02fa021d83327d38040f093af7802c757a51faa3acfde976a2afc41dcd4c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aoscompose-linux-arm64"
        sha256 "752b02fa021d83327d38040f093af7802c757a51faa3acfde976a2afc41dcd4c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aosguard-linux-arm64"
        sha256 "d88c1ce79a6dbc58dbbb5b77f6be3e82b911636bf8452391b7f5c68e44332c91"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.613.0/aterm-linux-arm64"
        sha256 "c39d852eda5e71a72c0185ba66c3e9923f32f91791f40f6c8e67e69dec36ce30"
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
