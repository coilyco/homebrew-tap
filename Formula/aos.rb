class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.556.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aos-darwin-arm64"
    sha256 "31803acd789d71b8db09298477f862ebddfa6993f0499f846b15ea0494b3de0c"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aoscompose-darwin-arm64"
      sha256 "31803acd789d71b8db09298477f862ebddfa6993f0499f846b15ea0494b3de0c"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aosguard-darwin-arm64"
      sha256 "584173e81a0f56695fc972388c79048362a37598e42c313069bca6ea3c527445"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "64a5c7d171e22f2e3ac6dc601baa79216bafa0b6cbe882bb97e8788487b96cc8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aos-linux-amd64"
      sha256 "38dc4ae411f7263244b2fb1939e127e0204f231b589b9fd1c37197d5ce5e7e3c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aoscompose-linux-amd64"
        sha256 "38dc4ae411f7263244b2fb1939e127e0204f231b589b9fd1c37197d5ce5e7e3c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aosguard-linux-amd64"
        sha256 "a91fe9a3dde145d985dc6334641c70307281745c6be571848ebb23b098a70f1f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aterm-linux-amd64"
        sha256 "a930a0f8d0b7d98974cee839c395e287d7dd6727ca748cf0163b0dfbe0436926"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aos-linux-arm64"
      sha256 "f7f7cd6f98101a855cd8d15e86a375a488afab805142abc97f3fb6abd7377233"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aoscompose-linux-arm64"
        sha256 "f7f7cd6f98101a855cd8d15e86a375a488afab805142abc97f3fb6abd7377233"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aosguard-linux-arm64"
        sha256 "0c7d6fd9365903ee867bb31dd2ad21bf4db67a6f10c7343ad9b231ea0f185ac0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.556.0/aterm-linux-arm64"
        sha256 "14407ab49759d0cbcd5f1420cd268460d626435f64c5527302080f6dad3af4f3"
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
