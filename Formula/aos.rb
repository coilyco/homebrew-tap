class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.623.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aos-darwin-arm64"
    sha256 "7674375300e43581b96686b1871af288e18eaa36f1a0a8e8ec2c34d02a44c562"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aoscompose-darwin-arm64"
      sha256 "7674375300e43581b96686b1871af288e18eaa36f1a0a8e8ec2c34d02a44c562"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aosguard-darwin-arm64"
      sha256 "fa279ee65ec83ef39f6e84987b6f2b6f3c442d9dea024b4a0e9df2d7d4dd5616"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "08e46af13d25c7fce493aa1cbf33af8251e1a566e52986691a7c3fc499045ec3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aos-linux-amd64"
      sha256 "bb870c85906e4c9c7f078fc70cfd365b070bf212d9fe5861260262c4139f57ea"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aoscompose-linux-amd64"
        sha256 "bb870c85906e4c9c7f078fc70cfd365b070bf212d9fe5861260262c4139f57ea"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aosguard-linux-amd64"
        sha256 "6efde5faf9fe8fda047c4f609182755ae29b7ef3bceee7af20848195042f1a50"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aterm-linux-amd64"
        sha256 "c0d437aa4364a3e1b2b0db322784758a1867c65b2ef07bb2af38aa1e06c76246"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aos-linux-arm64"
      sha256 "afb959831c3bbc0bb74404d5191dc30543fcb88e0db8af7cbb2318760cca9a50"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aoscompose-linux-arm64"
        sha256 "afb959831c3bbc0bb74404d5191dc30543fcb88e0db8af7cbb2318760cca9a50"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aosguard-linux-arm64"
        sha256 "aad50b3d03987e50a47fcc31d5bf6a052aed5779be0326e490916e62e5532844"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.623.0/aterm-linux-arm64"
        sha256 "e3227383c6a89ab3362c52e8acd6f29e9ed024f95018c7cdc43091ebb93d7286"
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
