class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.626.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aos-darwin-arm64"
    sha256 "ff4f0102634535f0ceca43d5bdc08bf075541853016bcdb3c4b90901d302f9ae"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aoscompose-darwin-arm64"
      sha256 "ff4f0102634535f0ceca43d5bdc08bf075541853016bcdb3c4b90901d302f9ae"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aosguard-darwin-arm64"
      sha256 "2427d941b79b15d0b3c82e2639fcabd67d319f6e36aed7fb0b39c82eb681cf47"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "8f0d832862adf5c4770e10b3f87d1c6255f627662bb1337400d5c1e9425fcd65"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aos-linux-amd64"
      sha256 "ab494b2598aa8a1991832852d98460a90f6042280caad4e7b8192232ebbac52d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aoscompose-linux-amd64"
        sha256 "ab494b2598aa8a1991832852d98460a90f6042280caad4e7b8192232ebbac52d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aosguard-linux-amd64"
        sha256 "58c63189f3541b188a8d3330ca850711485b02f9c436b8b677e9841cf7d9369d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aterm-linux-amd64"
        sha256 "2c2a14a3f53951d0e91f68e1c4deb5d56bbb597b6ad6eac62b76a614b88aeb3e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aos-linux-arm64"
      sha256 "601acded4017d9b7f3ee9d77d85f5db295f2b53a7295a0714e57ab5a1f49c3b1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aoscompose-linux-arm64"
        sha256 "601acded4017d9b7f3ee9d77d85f5db295f2b53a7295a0714e57ab5a1f49c3b1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aosguard-linux-arm64"
        sha256 "29fe4212b9ed10c1c5daaeb414b7a373fa6598b839a69970ba845f377a6da7cd"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.626.0/aterm-linux-arm64"
        sha256 "1a0881833273d02550a2dcd07918483bd4236ed34f906d554f04be84b92e86a3"
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
