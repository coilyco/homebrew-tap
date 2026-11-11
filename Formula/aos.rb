class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.592.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aos-darwin-arm64"
    sha256 "dbf040ed0ff755c9068f2b491a58a61c398c4aa19074bfc7bab1fe8ed77c1c4c"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aoscompose-darwin-arm64"
      sha256 "dbf040ed0ff755c9068f2b491a58a61c398c4aa19074bfc7bab1fe8ed77c1c4c"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aosguard-darwin-arm64"
      sha256 "7a98cc93f869a0c347374f4443cf866c51b79d1fa7c218651837b659f1078211"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "f42ba4f98a76819911dc8d311ca490a5f32a3d6ce9b031abdec12bbefcce4419"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aos-linux-amd64"
      sha256 "a72b34e9e62236aa75bb3f4971f0591dbc4228a107dd82d4ea3a816b451e18dc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aoscompose-linux-amd64"
        sha256 "a72b34e9e62236aa75bb3f4971f0591dbc4228a107dd82d4ea3a816b451e18dc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aosguard-linux-amd64"
        sha256 "0f207b61004181212c89246facc4aa7501aa0263170b4d82def6bdfb7f111286"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aterm-linux-amd64"
        sha256 "36c59ae817be75aa1bf7662172df6783c2c72b7240290a2f20504ca663df6d46"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aos-linux-arm64"
      sha256 "302925fc2c4145a7560f2fdb8a0dd927d891698396265a1cc9cf81e27b3f39a0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aoscompose-linux-arm64"
        sha256 "302925fc2c4145a7560f2fdb8a0dd927d891698396265a1cc9cf81e27b3f39a0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aosguard-linux-arm64"
        sha256 "2a98999df632e3f0e01cd0bf12d9148b7c2845cbbfb19047964afb28a41eae0d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.592.0/aterm-linux-arm64"
        sha256 "80dba8b8bcd81607641c07bb1b3b19f0a502e7714ee599115b7fb56776d34567"
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
