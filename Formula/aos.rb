class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.550.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aos-darwin-arm64"
    sha256 "3d7213a251028c5c98c98cc6de1b4e0360068e8eda54f24e9bfee39cc78b13d5"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aoscompose-darwin-arm64"
      sha256 "3d7213a251028c5c98c98cc6de1b4e0360068e8eda54f24e9bfee39cc78b13d5"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aosguard-darwin-arm64"
      sha256 "1b98bbc7242dfd4f0d4287b9d7de1628e837d71f6fdae95a6222cfbda599abfc"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "85c676ab1022590d7778c9438e8655dcd4f01307449810745a1e6fba17326b3a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aos-linux-amd64"
      sha256 "14e326179b25ea13ca4a4478daf161fc9c97e5d0d9e3355c55c4bd666922d344"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aoscompose-linux-amd64"
        sha256 "14e326179b25ea13ca4a4478daf161fc9c97e5d0d9e3355c55c4bd666922d344"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aosguard-linux-amd64"
        sha256 "a8f8bcecd158fe2db56eada4741eb8715139b585ca60ac3856996e0e6aa9d841"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aterm-linux-amd64"
        sha256 "d886f36db621c4a0a9e6fbdbf1f9d790b04f1a02f36035d305edc666286716f3"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aos-linux-arm64"
      sha256 "758e3ec12b686c217d203f55976840367d42fffb3a463f900af18917fd8f0ade"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aoscompose-linux-arm64"
        sha256 "758e3ec12b686c217d203f55976840367d42fffb3a463f900af18917fd8f0ade"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aosguard-linux-arm64"
        sha256 "2332647ab347e4313f7f471432b95974505defec41387c3c86cb2db4a0f2c2d5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.550.0/aterm-linux-arm64"
        sha256 "959ca2b10263e250f8141f41b8144522ec3f4f4159059b54c73f76903fe63a0e"
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
