class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.598.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aos-darwin-arm64"
    sha256 "3a9c9091f0545624aa9b6148686319f696ab56c1065b69f9a4bf7fa80de865e3"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aoscompose-darwin-arm64"
      sha256 "3a9c9091f0545624aa9b6148686319f696ab56c1065b69f9a4bf7fa80de865e3"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aosguard-darwin-arm64"
      sha256 "972013c244c901e4e39fe08cc3563d0d48d224c794aa66cf965c70df4020f287"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "820b03e6f9f7d094cc16f849f0217d4006ae5ae4139b22466c271aa485ab9a69"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aos-linux-amd64"
      sha256 "1f3e27b427f1bfd8ae6abf07ae5e8092a89d2be3d6a2e7a2eb880286710380fb"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aoscompose-linux-amd64"
        sha256 "1f3e27b427f1bfd8ae6abf07ae5e8092a89d2be3d6a2e7a2eb880286710380fb"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aosguard-linux-amd64"
        sha256 "054c224b3676dd62ae41b8c5fee2964fdca34a091b7930d9168cde1e43bf2829"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aterm-linux-amd64"
        sha256 "35816c1d2665c1f68ac0e4c7dabbbe6096a4b048182812e3b769bbac8054af2f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aos-linux-arm64"
      sha256 "a52d4e0ad1f2a6f49e1a43252255e5c3d3d8b4f0d68e7b409e219d05aeed34b0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aoscompose-linux-arm64"
        sha256 "a52d4e0ad1f2a6f49e1a43252255e5c3d3d8b4f0d68e7b409e219d05aeed34b0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aosguard-linux-arm64"
        sha256 "a63426e36e219143ee84301da69acca268948b191e4b438c3fa1f15af0bfbbb0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.598.0/aterm-linux-arm64"
        sha256 "169b93f15bb793a165815709c3f4ab24a7c88a4d1f2a59fbe9475218557b8f66"
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
