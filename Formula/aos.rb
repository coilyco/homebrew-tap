class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.536.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aos-darwin-arm64"
    sha256 "45add03cb801f7119f52d70f3b3441afeed8b5bf854f8fa739d67b4e5a7d1d9e"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aoscompose-darwin-arm64"
      sha256 "45add03cb801f7119f52d70f3b3441afeed8b5bf854f8fa739d67b4e5a7d1d9e"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aosguard-darwin-arm64"
      sha256 "21f50de93a8bc348325d0fbf5eb5e4130735cd989e6d50191d4471af82f828bd"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "fbba1a1763c67ea47121fd949555ab4154991678096f59eb3b12a11adda84ebd"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aos-linux-amd64"
      sha256 "294d2a2fda2015cc5078fd83f0d846a6f4874cd42e1fb3fe04b5adc87b6329e1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aoscompose-linux-amd64"
        sha256 "294d2a2fda2015cc5078fd83f0d846a6f4874cd42e1fb3fe04b5adc87b6329e1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aosguard-linux-amd64"
        sha256 "242a89d4f8c870ed2cca0de4eb92737e678c10aad980aa5c33db2bf630dba2a3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aterm-linux-amd64"
        sha256 "fd21a8dd8841cd718df823422edee07585868dd13d64395b5cc3288e46230509"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aos-linux-arm64"
      sha256 "d545a26ea83c887dbd43ce2ca364ed00b5bd0b96ebf63880c52ac04952260671"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aoscompose-linux-arm64"
        sha256 "d545a26ea83c887dbd43ce2ca364ed00b5bd0b96ebf63880c52ac04952260671"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aosguard-linux-arm64"
        sha256 "84ddcad199bc62166162ceffa70764f95292dd19a00804f5dcd67987e396d9cd"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.536.0/aterm-linux-arm64"
        sha256 "cf86f1c8c374973727b48a0deaa709085f2f2178821de1217cd6469dd8b3b6c1"
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
