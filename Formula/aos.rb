class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.651.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aos-darwin-arm64"
    sha256 "7366848b9c373601310dab3d5ec36afb02376bdef0c5ffb3bda83bcf09d7331d"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aoscompose-darwin-arm64"
      sha256 "7366848b9c373601310dab3d5ec36afb02376bdef0c5ffb3bda83bcf09d7331d"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aosguard-darwin-arm64"
      sha256 "d41791aa53ee25473061be50846c4ffc46357085c9c6c1d0b400baddf5ff2c6c"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "5691f6035055e6a8f578c3387f0bdaee5caa29d45ff9b11c350e197c2b38915a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aos-linux-amd64"
      sha256 "2e1fdec5b6b2d5e20a829dfee26cd932184b1b27f64c3d0e5bc7a3d17bfe7c27"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aoscompose-linux-amd64"
        sha256 "2e1fdec5b6b2d5e20a829dfee26cd932184b1b27f64c3d0e5bc7a3d17bfe7c27"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aosguard-linux-amd64"
        sha256 "bc0dbb4adb218a2e83593e5feb20a585435a23e7839bb1929e8490192a6ac568"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aterm-linux-amd64"
        sha256 "ec7d89f1ace526edf64820b6d4e67384ba2b2f8520a481f7a5a9d663fe4d6997"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aos-linux-arm64"
      sha256 "c0a73419adb9990b1cce2029fd0142a7f63d1beb86aabfe619b041bf2515e10d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aoscompose-linux-arm64"
        sha256 "c0a73419adb9990b1cce2029fd0142a7f63d1beb86aabfe619b041bf2515e10d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aosguard-linux-arm64"
        sha256 "0fbd0a0b2101d49179c1b78e8ce895e7b03c419b6250a7e6b6818bffcd0b3b57"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.651.0/aterm-linux-arm64"
        sha256 "af0baf20a4e1a80b60c199528ad556c8aebf336ab74dfa2d69585dc5b2c09e54"
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
