class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.542.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aos-darwin-arm64"
    sha256 "7dca863aa2003a6b38b6ec0ebb8270726f068b94e0e45b5eed84f459f8d7068f"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aoscompose-darwin-arm64"
      sha256 "7dca863aa2003a6b38b6ec0ebb8270726f068b94e0e45b5eed84f459f8d7068f"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aosguard-darwin-arm64"
      sha256 "136b9bdc22b72ac2d4faf6f515e8f7d777ee1b6cd21ea46ce1a3c6c581826fe6"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "ea7f10aca05fd3a446a25c9ed5705212c6a4b73e53fac314a50a8d1aa2a5b20b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aos-linux-amd64"
      sha256 "f25774bf14842e28fd51a61915d03046fdfc5a3fcfd1f529c950a8593580ac30"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aoscompose-linux-amd64"
        sha256 "f25774bf14842e28fd51a61915d03046fdfc5a3fcfd1f529c950a8593580ac30"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aosguard-linux-amd64"
        sha256 "0e429cdacb45c38ec51dbbfd503bd2d5d39868bdfbf18b474af32b733cfc92f2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aterm-linux-amd64"
        sha256 "160d5cd1b57276683ec01354c832605eec290d7b2f1993958cea3c339417ba25"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aos-linux-arm64"
      sha256 "b66021e666ecffdd7faf791e3477d677e7e8f3e7de64f8a5db01d451c6b9f6b5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aoscompose-linux-arm64"
        sha256 "b66021e666ecffdd7faf791e3477d677e7e8f3e7de64f8a5db01d451c6b9f6b5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aosguard-linux-arm64"
        sha256 "329e0312509d569c7416a199d1b06137eec68d96c76df24c39ac2feca1599b23"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.542.0/aterm-linux-arm64"
        sha256 "7d2d20214b42f9fdbc1d1ad3b5e1b5a8d6b6668dd3de12404eb59bbebb612e3d"
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
