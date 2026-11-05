class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.525.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aos-darwin-arm64"
    sha256 "086553f95619d3315713a5fd75ee6ae2b10331c362293962746fce35846785da"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aoscompose-darwin-arm64"
      sha256 "086553f95619d3315713a5fd75ee6ae2b10331c362293962746fce35846785da"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aosguard-darwin-arm64"
      sha256 "b662c77bb1ad37d80aef94fc0db699c0dcd5ccd86ae045cc691189289643b2b0"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "9f8aa0b2b5ec193918b1c79a575aa3e30f7e4e1030f6ab287ef1d4181cbad58d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aos-linux-amd64"
      sha256 "214ec54e9c4c1093b1041a214ab7c6a80eefb3180b7168104e3c342a270600a7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aoscompose-linux-amd64"
        sha256 "214ec54e9c4c1093b1041a214ab7c6a80eefb3180b7168104e3c342a270600a7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aosguard-linux-amd64"
        sha256 "f2b55fded02b8dfa410f67154e069b42d577af6e4cecf5e7913a661364e584aa"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aterm-linux-amd64"
        sha256 "2e67d0dfb2160419cdcdd45d73c314706fcc808afca8391c7db63cf38b732a7b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aos-linux-arm64"
      sha256 "688d2925187686ffd39236b3217c9e57b4b9f55623a6f819d13c5c4baa91570e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aoscompose-linux-arm64"
        sha256 "688d2925187686ffd39236b3217c9e57b4b9f55623a6f819d13c5c4baa91570e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aosguard-linux-arm64"
        sha256 "db4b9f23fa232a046e50d6176ffb86708279a34a36d1ee0aa585ac329398c73f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.525.0/aterm-linux-arm64"
        sha256 "8356727ba9a994953c6026172f40e0fb1c9edf9df5093dd72423dcf5ccbbee2d"
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
