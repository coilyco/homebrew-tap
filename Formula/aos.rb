class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.523.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aos-darwin-arm64"
    sha256 "9ff0f33d7612fb2cfc1b6a01f4bd15b4fb4a5e2b4922e481c41d4b0ed035bb74"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aoscompose-darwin-arm64"
      sha256 "9ff0f33d7612fb2cfc1b6a01f4bd15b4fb4a5e2b4922e481c41d4b0ed035bb74"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aosguard-darwin-arm64"
      sha256 "f661e3bd0bea2ad9c98ca2962d1f14e83478534626b484222cd1e2bfe9bfc203"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "47ea27d685d3090414218c0ba4f71ed61c38cf0520cb95b5c1ce180c91b79eb5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aos-linux-amd64"
      sha256 "88d93845106c0c6ef2036b9eeec7448e5f4ada4bf489941f60de9d861f191dc7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aoscompose-linux-amd64"
        sha256 "88d93845106c0c6ef2036b9eeec7448e5f4ada4bf489941f60de9d861f191dc7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aosguard-linux-amd64"
        sha256 "3de74e38527ee8a793b87dfc787ac7483b5f218bb14501110e5934e9e85e5637"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aterm-linux-amd64"
        sha256 "9f240ea3524ff58ea9f660381a2d05b443687dba89befc26209afa1b73b35587"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aos-linux-arm64"
      sha256 "3078fc41988b38b487ccec350bf038d8c6534bf91c58445ccc40d3e4b7d9e636"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aoscompose-linux-arm64"
        sha256 "3078fc41988b38b487ccec350bf038d8c6534bf91c58445ccc40d3e4b7d9e636"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aosguard-linux-arm64"
        sha256 "b371620c9ccbc65c432742e0b521cc72a32d2e1435759b33b08ad97f077e01fd"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.523.0/aterm-linux-arm64"
        sha256 "15a8cc420d5b8ca678e45708c4e52b690f232e24f2c13cfe7854a16f4e7f3204"
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
