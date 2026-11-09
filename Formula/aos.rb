class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.557.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aos-darwin-arm64"
    sha256 "c67fd16c9f126d4c760224e37d847f048dce6a4c82e31f5c3e399294c328a52e"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aoscompose-darwin-arm64"
      sha256 "c67fd16c9f126d4c760224e37d847f048dce6a4c82e31f5c3e399294c328a52e"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aosguard-darwin-arm64"
      sha256 "a4364b5d7f8894f2fe20b114b62f5a46a1ad655d8d4a13a2add412dd02cea71b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "728f44570856f295d49bcb2001b44241a281edaa2a7818ae935ec2db71aae8a5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aos-linux-amd64"
      sha256 "a0c2c59dba8e3e2c0fe5da4017e9de616423ad726ca3674c8a6b47e14e6db4b4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aoscompose-linux-amd64"
        sha256 "a0c2c59dba8e3e2c0fe5da4017e9de616423ad726ca3674c8a6b47e14e6db4b4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aosguard-linux-amd64"
        sha256 "219251555264de86ee4bb70c6c7c758332c238639f04b56d2e4df932afd0afaa"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aterm-linux-amd64"
        sha256 "1994d37227f8c28579115052c07a9e362dde930632dfa848af02c49bac5a43e6"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aos-linux-arm64"
      sha256 "69b8f6ee680ea375513ea178de445b6da4483c1a52b1d307de1646b74279269a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aoscompose-linux-arm64"
        sha256 "69b8f6ee680ea375513ea178de445b6da4483c1a52b1d307de1646b74279269a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aosguard-linux-arm64"
        sha256 "d212dc59d6ebd35e7ee3e41e0fd08c96ef41eaa532f3bd637248fee76ede561b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.557.0/aterm-linux-arm64"
        sha256 "c7015c960b71c3ae91e3941b6800d68b00e54a8ea3dbf5caadf217cbfc1d5f54"
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
