class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.595.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aos-darwin-arm64"
    sha256 "dff37efaf78bdfc9da98d172f6fce7007a6bbfa99ca72f381b9c136ebce2bed6"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aoscompose-darwin-arm64"
      sha256 "dff37efaf78bdfc9da98d172f6fce7007a6bbfa99ca72f381b9c136ebce2bed6"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aosguard-darwin-arm64"
      sha256 "c866ef4b7b2dacbfc8168d50f6671073e084f644436af611fa147c67c281b718"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "06ffe35fb0437bb996266ae3ad7c0fa215006d1027bb42efc27d15c353a2285e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aos-linux-amd64"
      sha256 "ebe21af3b73b0c3505d74a7b3434f95051bc11a19508a29334503ec621c72388"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aoscompose-linux-amd64"
        sha256 "ebe21af3b73b0c3505d74a7b3434f95051bc11a19508a29334503ec621c72388"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aosguard-linux-amd64"
        sha256 "b05f64d35b4c3f1a99a42109fec6d0cf372c5ea180cf6feb15d11f2d80741299"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aterm-linux-amd64"
        sha256 "995d8c993a86521221f0f64c0979c1536be20528fead123750254c6a0e1df847"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aos-linux-arm64"
      sha256 "532496dad75c7bfc9660ea2da0a4a5c82f138ad7381ba6046ddd46e717d86803"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aoscompose-linux-arm64"
        sha256 "532496dad75c7bfc9660ea2da0a4a5c82f138ad7381ba6046ddd46e717d86803"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aosguard-linux-arm64"
        sha256 "2abe431ed0b3e5eeb635325a283c9cd9b0011ef611725b15e7c752e202564235"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.595.0/aterm-linux-arm64"
        sha256 "471a7e57015a2e5ad308f8ad65f58a7bd37510bc2fb0cfe54e4109380f3c461f"
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
