class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.643.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aos-darwin-arm64"
    sha256 "b9676c6dd6f9c2ca8ec81a6e5438d533910e99e438c5c054b00453b2f0923fb7"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aoscompose-darwin-arm64"
      sha256 "b9676c6dd6f9c2ca8ec81a6e5438d533910e99e438c5c054b00453b2f0923fb7"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aosguard-darwin-arm64"
      sha256 "e5dda876dc1ffdb6920366ea5669917d60e54ccad6276474426e0123cd48a56a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "f8734ce6938f3292256b8bbd8d8b08e5cf8be2b381c1752d71c7d7eddd0ae548"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aos-linux-amd64"
      sha256 "562a725f7ec0622c5c4eca46aa51d785c65c112550ba7f116e6baf513fe6a2b8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aoscompose-linux-amd64"
        sha256 "562a725f7ec0622c5c4eca46aa51d785c65c112550ba7f116e6baf513fe6a2b8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aosguard-linux-amd64"
        sha256 "1d3e00e636dba591cf2d25a1e8b70bd37a48df1f4e3021eec75daddc4cb7dcef"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aterm-linux-amd64"
        sha256 "c60cdec06f292e2cc077c7b4cd5b151a62caf3dfc65e4715e43b4d34dca75cad"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aos-linux-arm64"
      sha256 "7355bcd585fb80ab2fda27a703a78b15e7a2f192e60ee333c713f7aef9969ba0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aoscompose-linux-arm64"
        sha256 "7355bcd585fb80ab2fda27a703a78b15e7a2f192e60ee333c713f7aef9969ba0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aosguard-linux-arm64"
        sha256 "580e08016c9f98af4138d9506c8c2a463a4609c8640b425ce9cf81311c8d43a7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.643.0/aterm-linux-arm64"
        sha256 "60b7a5299d1be8a560b66935ffff4ed717d1bfb0c04ffc1229e78f6e06c44eb2"
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
