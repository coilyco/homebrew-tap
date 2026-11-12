class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.619.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aos-darwin-arm64"
    sha256 "a49a120a2c420d17fef3421f078f995a7efad90a4eed863c1eef472f7c348a06"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aoscompose-darwin-arm64"
      sha256 "a49a120a2c420d17fef3421f078f995a7efad90a4eed863c1eef472f7c348a06"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aosguard-darwin-arm64"
      sha256 "168ee1996d84b0f8bd53bc8f460ee2b98dd3beee5afdd551e78c8026748c7674"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "124f49933cb078c88a2b0dc2b0ab2e65d5d84ff17209515d4d4231d39bf128f9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aos-linux-amd64"
      sha256 "e967c62cc54e3d6f02aedd3f80a2e592037c6df4c2b614124e52d5b84181a826"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aoscompose-linux-amd64"
        sha256 "e967c62cc54e3d6f02aedd3f80a2e592037c6df4c2b614124e52d5b84181a826"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aosguard-linux-amd64"
        sha256 "a7a5f53ce65529d0fcfb6da3a39c1f8c833d8c079a13a99ef1a3e681f9eaadc6"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aterm-linux-amd64"
        sha256 "cc4d1dbb58b1ed122b388549a8eff85c5681eebc29b9ff970fc2b88645690b2b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aos-linux-arm64"
      sha256 "c02e6d26e43e97dc5808274e9704b83005cd099863d392a628ff744d1ac5311a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aoscompose-linux-arm64"
        sha256 "c02e6d26e43e97dc5808274e9704b83005cd099863d392a628ff744d1ac5311a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aosguard-linux-arm64"
        sha256 "5232de75ab35c4c8898248c20d853469d78a75db8c3e85cbc0a849d2f5453dfb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.619.0/aterm-linux-arm64"
        sha256 "ff9e2e002b2da3a5bd41b1022d99b42e0e5c25e4c8c109b3ea2d42c0e329c8e7"
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
