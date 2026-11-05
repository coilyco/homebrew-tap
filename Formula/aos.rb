class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.520.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aos-darwin-arm64"
    sha256 "4230b6f8218012cd0466822fce2832e141526042a385b52ad8e47bc2b882e6ef"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aoscompose-darwin-arm64"
      sha256 "4230b6f8218012cd0466822fce2832e141526042a385b52ad8e47bc2b882e6ef"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aosguard-darwin-arm64"
      sha256 "8bf4bd404d5777f1719e5d89730a19047c75204425ea9ee96da80a4872cc5477"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "2cdf1afa8fad1afde851397164fe0e66169d1c5010ffaf3b314d9cd99815da0e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aos-linux-amd64"
      sha256 "3d8b7f44a443eddacc590fd048faf8b66ced79b117ec2edad25de14d3d093139"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aoscompose-linux-amd64"
        sha256 "3d8b7f44a443eddacc590fd048faf8b66ced79b117ec2edad25de14d3d093139"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aosguard-linux-amd64"
        sha256 "826d68613d74b58c1c3f3dd73c5b07344b1409b6b98953869b41e3f1d49d3f2d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aterm-linux-amd64"
        sha256 "c7f33deb514b2c63338f4018138affdafbde5b7151e14b42693e686da80b51a1"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aos-linux-arm64"
      sha256 "e83f47820bda6c9e750ea69b63fa8fcf317eacfd6cb69ac1f1fe9638315a5eb0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aoscompose-linux-arm64"
        sha256 "e83f47820bda6c9e750ea69b63fa8fcf317eacfd6cb69ac1f1fe9638315a5eb0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aosguard-linux-arm64"
        sha256 "2a4ac41fc7b23c6437a04d9806f069e643d5664a5e05d093c69bbbf69562cb0e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.520.0/aterm-linux-arm64"
        sha256 "09d3263b8f6843ca26f13daee24c6ce9eec75d42235c468ec2d8d2797ae87420"
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
