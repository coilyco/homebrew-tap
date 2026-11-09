class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.544.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aos-darwin-arm64"
    sha256 "6be2881609bcc456aa5669ddcc66dcc62a58255b1465ebc1c00fcdd9d1768dde"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aoscompose-darwin-arm64"
      sha256 "6be2881609bcc456aa5669ddcc66dcc62a58255b1465ebc1c00fcdd9d1768dde"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aosguard-darwin-arm64"
      sha256 "05e19f17c3109ba7f352150f05914f4c9dbcc2d4fd7df716f25c27dc220b8de9"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "0e36d98c2f4c1be357fe2b65f5fcd0c1aded628d47d724308c81a36b73255db9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aos-linux-amd64"
      sha256 "8134dbfeccea32ca66e6d30638f0c955a92662c2b97e6f61a5aa811c16265f91"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aoscompose-linux-amd64"
        sha256 "8134dbfeccea32ca66e6d30638f0c955a92662c2b97e6f61a5aa811c16265f91"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aosguard-linux-amd64"
        sha256 "15c32337a4e6c01f24a6cf79278c166bbe1da4f6fd2803d89eb5a6428b912ed9"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aterm-linux-amd64"
        sha256 "cd1f456fe303ae09648f745889287d7942611ec7a73729e0809d94bbf90bffe6"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aos-linux-arm64"
      sha256 "c977ed968c11101b044fe06438d5993199ebf9cd508fcec357a9723a5a7d0fdf"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aoscompose-linux-arm64"
        sha256 "c977ed968c11101b044fe06438d5993199ebf9cd508fcec357a9723a5a7d0fdf"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aosguard-linux-arm64"
        sha256 "054b4101ddd760cb39177bb34c71cb784ee71a376f6bb922bf5dfdc2bc7c144a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.544.0/aterm-linux-arm64"
        sha256 "c9b50a1eb3b30e7ca692f8fe5637c8aa9bb80837d99374e805ad706f7527397d"
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
