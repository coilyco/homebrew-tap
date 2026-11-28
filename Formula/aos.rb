class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.649.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aos-darwin-arm64"
    sha256 "20b510b3cd08b295f62b47fd03ba48e70db0dab0aa37e846437ad23edd435212"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aoscompose-darwin-arm64"
      sha256 "20b510b3cd08b295f62b47fd03ba48e70db0dab0aa37e846437ad23edd435212"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aosguard-darwin-arm64"
      sha256 "5d10cd0ec5d1cc0cc569b0a9bedfa8c0ae67cd630b6b306498d5695823aaac68"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "ba4863d6d3b73fe42b566658e952daa6305f2697d42dddb67be6a2b2aeb20322"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aos-linux-amd64"
      sha256 "3e01e5216b2874a7e3d26be0cc2d9953c31dee68cd72e352cb563071ed9bbbc2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aoscompose-linux-amd64"
        sha256 "3e01e5216b2874a7e3d26be0cc2d9953c31dee68cd72e352cb563071ed9bbbc2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aosguard-linux-amd64"
        sha256 "2607728106948bae5b39f03f5e24cef304fd33473099dd0a2f84e2c64360d80f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aterm-linux-amd64"
        sha256 "727c0f9ae45ac52bc6c3b871dc16c9b32a350e3ef813c9a02661f4e3bddabaf9"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aos-linux-arm64"
      sha256 "dfafbdd8768cc1c085b56487b5c384ad6c44d8a99feeff7d282be056c97c95a3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aoscompose-linux-arm64"
        sha256 "dfafbdd8768cc1c085b56487b5c384ad6c44d8a99feeff7d282be056c97c95a3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aosguard-linux-arm64"
        sha256 "80b426196010965082a5234bcf1a83a4c0a6b33a8b58fd424643cb978ea1d5db"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.649.0/aterm-linux-arm64"
        sha256 "ca3a5cc6545175f4676d5ec46d380f87698a16aeaae610a9cfa62705d9b90683"
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
