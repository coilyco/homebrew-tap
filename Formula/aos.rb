class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.538.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aos-darwin-arm64"
    sha256 "ce0a1184ad70e44e4a009dadd12e427cbe14d8c01020131943c956dd6f3e0624"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aoscompose-darwin-arm64"
      sha256 "ce0a1184ad70e44e4a009dadd12e427cbe14d8c01020131943c956dd6f3e0624"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aosguard-darwin-arm64"
      sha256 "0f88310242d6c9a0be6ca18ad7d7e097dc4f993591d9918c2326b25415c397b6"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "53f3dfad511481ed34113320ccf4f3865505dfb5bf6a48adfb370f517d97ce19"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aos-linux-amd64"
      sha256 "558c03c0626af38a211828d6846fd4d2e3bbfbcb83a2965bb8e034db76c3cbbc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aoscompose-linux-amd64"
        sha256 "558c03c0626af38a211828d6846fd4d2e3bbfbcb83a2965bb8e034db76c3cbbc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aosguard-linux-amd64"
        sha256 "159a7a610143ef2f978870356d02273c398eac30e1390401b79b7e14fa7dc4b5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aterm-linux-amd64"
        sha256 "703451bf63f0b9dde01990f6dd715ffa8997b43d2991b22bc9a2330f0f0ffd39"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aos-linux-arm64"
      sha256 "2610ca23ccceb8b0c4c9db9d9416081608b12f7cb8c7820a62a6372a405cdfad"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aoscompose-linux-arm64"
        sha256 "2610ca23ccceb8b0c4c9db9d9416081608b12f7cb8c7820a62a6372a405cdfad"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aosguard-linux-arm64"
        sha256 "d934841ff66d9520eac6df4170d6c3e7658283e3752af24855911c7701cc24f0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.538.0/aterm-linux-arm64"
        sha256 "56bafdb91c67a5e2cb86a0f9c7c22ae90517cd01c5760880ea60be6e0dc85928"
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
