class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.616.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aos-darwin-arm64"
    sha256 "3970ad7883026428092f881c3f89d58d840bfc794be8435493d35425760dcad4"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aoscompose-darwin-arm64"
      sha256 "3970ad7883026428092f881c3f89d58d840bfc794be8435493d35425760dcad4"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aosguard-darwin-arm64"
      sha256 "2d9d0fa4f4c2e61da868c1e3b2a8eb348905d9137fc8588b88df7300746b12f7"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "409af08243273dcb795947bac29a7607d14932f600be7649e26aa953b3bde7dd"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aos-linux-amd64"
      sha256 "84946d916805fa6550f04e9279453109ac776ab0cc1d8e462cefdd6da1791434"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aoscompose-linux-amd64"
        sha256 "84946d916805fa6550f04e9279453109ac776ab0cc1d8e462cefdd6da1791434"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aosguard-linux-amd64"
        sha256 "c3d102bde3e150ba673a624cee7f6dccc156010f334301fa33e15567b4390410"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aterm-linux-amd64"
        sha256 "0dc0975ccf3eeaffccb8c730b4a3ff9d064889058bebc8a1093a6fda2ea62e6f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aos-linux-arm64"
      sha256 "3f10b94bad139454b1a57f632fce30871e6a8b6728e1c223e32bcd155e4af785"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aoscompose-linux-arm64"
        sha256 "3f10b94bad139454b1a57f632fce30871e6a8b6728e1c223e32bcd155e4af785"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aosguard-linux-arm64"
        sha256 "d358671d7047f0b96ecafbf252bdf637d25e2f930b4b935568f678a9d74b2fd3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.616.0/aterm-linux-arm64"
        sha256 "23b9db40a660017fb30af6c6de19c25f94066ed3d89d27b23d5ab603b924beac"
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
