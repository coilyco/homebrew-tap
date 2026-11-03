class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.491.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aos-darwin-arm64"
    sha256 "c386f31ce1c09a33d90da7ca2d185e263da231c44e61cba76ab181284525f9a1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aoscompose-darwin-arm64"
      sha256 "c386f31ce1c09a33d90da7ca2d185e263da231c44e61cba76ab181284525f9a1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aosguard-darwin-arm64"
      sha256 "bc3454a36a71bbe8eb283b5d9dd97791ac2f474347fc26a68c73b1750eea1fe0"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aterm-darwin-arm64"
      sha256 "692684dcf92ec524e617b2504502cf45ebcc503867685ff1d66bd9c19f2dcc58"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aos-linux-amd64"
      sha256 "a98de2d93f132fa531c260aade30be61a2210779e755c72a4b41926e6c2c91c9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aoscompose-linux-amd64"
        sha256 "a98de2d93f132fa531c260aade30be61a2210779e755c72a4b41926e6c2c91c9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aosguard-linux-amd64"
        sha256 "ff914a751c50266c83bb3c24b546353784720c9e35d4fec524683a0b908fe48e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aterm-linux-amd64"
        sha256 "511994247a8e147c43258d006bd7877f9fee931af0bf585c286b0792e17f1a14"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aos-linux-arm64"
      sha256 "ef5670c2660d854ac46251c6a9c9032ccce2945f2838c36f98c5dc0f5a4c6302"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aoscompose-linux-arm64"
        sha256 "ef5670c2660d854ac46251c6a9c9032ccce2945f2838c36f98c5dc0f5a4c6302"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aosguard-linux-arm64"
        sha256 "eda5277fd1a1203ae7e7e10573d55c18c1d0b00c6d88810d8f77e20bc9e91022"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.491.0/aterm-linux-arm64"
        sha256 "3061210fad62f55d29d42b1a2bd4747db49d315921a3ee609778cdbcd2874686"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
