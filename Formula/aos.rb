class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.624.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aos-darwin-arm64"
    sha256 "1003a1641b909ef7198dd953d2605d22e1049b2ed88653942a9ee257b8ecdea2"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aoscompose-darwin-arm64"
      sha256 "1003a1641b909ef7198dd953d2605d22e1049b2ed88653942a9ee257b8ecdea2"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aosguard-darwin-arm64"
      sha256 "65865ecdb9137e8a5f51f3cdc4788487c4f531921e92318a4c003dcc4b138b70"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d62fd59a2f705b78eeba217b9aabfd79bc26c001ceafc97cb3d9489d286aa3a1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aos-linux-amd64"
      sha256 "992de7fbc996dddb2b97b482d2fff9baedf3b0d319f24068ca5f2940462802ee"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aoscompose-linux-amd64"
        sha256 "992de7fbc996dddb2b97b482d2fff9baedf3b0d319f24068ca5f2940462802ee"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aosguard-linux-amd64"
        sha256 "5323f82db0153ec8de21b150e010bf62610be4ac4928794bab1f7f44f17bd49e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aterm-linux-amd64"
        sha256 "60ead68ef5f2e3aeda987bd213f1e62fc4bab3f47354dcf3dd6f825a5bdd1ae8"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aos-linux-arm64"
      sha256 "c8a2655b09c4366b4471c92175da2a84e4471f67ff3f1c09581f09516dd08940"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aoscompose-linux-arm64"
        sha256 "c8a2655b09c4366b4471c92175da2a84e4471f67ff3f1c09581f09516dd08940"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aosguard-linux-arm64"
        sha256 "581caf73655628aa728c0c63bd57c8188f6979fa4f5835a8faec990a232132d2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.624.0/aterm-linux-arm64"
        sha256 "75064dcc399ad46486b60f00f5b73ce6a1d216c196fa7f5a769fb2b73799ef56"
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
