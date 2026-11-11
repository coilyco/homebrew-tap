class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.606.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aos-darwin-arm64"
    sha256 "b8243e093b8de565d2098034910a8a50c0cc1d14b866825c263a8ce9ec5c2742"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aoscompose-darwin-arm64"
      sha256 "b8243e093b8de565d2098034910a8a50c0cc1d14b866825c263a8ce9ec5c2742"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aosguard-darwin-arm64"
      sha256 "b09e05ce1eed4e9bc3e7cdbf17240545398118f92781494fadbcd3065b371dfd"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "c08118572a3a6cbbd5750edebdea453d5064112a9ef02b1118c1cfd06b9b0c9e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aos-linux-amd64"
      sha256 "a1d125759dd8fa029c4c1f439740c548c98d3d96e39e5f842473c8399b2f1ca3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aoscompose-linux-amd64"
        sha256 "a1d125759dd8fa029c4c1f439740c548c98d3d96e39e5f842473c8399b2f1ca3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aosguard-linux-amd64"
        sha256 "327544ecc09b7e6f3bca2b55348883b21aa8ee318c8c699b565635e15e99c92a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aterm-linux-amd64"
        sha256 "934cc63d9133d01dc6a2f79027b757fb6c50c96a4aa10eed033ad84b8f12ef11"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aos-linux-arm64"
      sha256 "6313053602ec4db8aedb166df788a31aa349eea5376f70e1b94d49200ce29fb4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aoscompose-linux-arm64"
        sha256 "6313053602ec4db8aedb166df788a31aa349eea5376f70e1b94d49200ce29fb4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aosguard-linux-arm64"
        sha256 "20614fafce5ce238fd91d32b9846c18e4b89e6370f92ce49099a065e3a84de9f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.606.0/aterm-linux-arm64"
        sha256 "dde6f9b805bb33bb86a118b34fb811005d9339fb02dedc27056c292c7b65a346"
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
