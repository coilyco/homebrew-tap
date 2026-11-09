class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.554.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aos-darwin-arm64"
    sha256 "a1e16894f15f5de0fb4b52b434f130a9645fdf4570ed974893765490d9d9c490"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aoscompose-darwin-arm64"
      sha256 "a1e16894f15f5de0fb4b52b434f130a9645fdf4570ed974893765490d9d9c490"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aosguard-darwin-arm64"
      sha256 "8ec12afe049d0c3d971607735c9fc17fe5a1df6b651c3df6ef4ebfc1051ae25c"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "44873328448d0493ee54ca851ad32aeebc7c16022751634fa5c6d2d9c27f25be"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aos-linux-amd64"
      sha256 "6b95ebd4b7f928b9e2c0f3100eb07be5d0a850a455c36dd589ddd30585353ff4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aoscompose-linux-amd64"
        sha256 "6b95ebd4b7f928b9e2c0f3100eb07be5d0a850a455c36dd589ddd30585353ff4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aosguard-linux-amd64"
        sha256 "cc2884dc46e15dcf207b6d392fc5fa17d99a93ebb2e228b92251aaaebd722106"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aterm-linux-amd64"
        sha256 "f6e56236a43059c133dcd5ff160473e72cb118ccc5dc44afb18d2d14b541930a"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aos-linux-arm64"
      sha256 "ede64ba14c4ad975e96ea594a37c797baf633de27474c7d1da9be813f36fc4ac"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aoscompose-linux-arm64"
        sha256 "ede64ba14c4ad975e96ea594a37c797baf633de27474c7d1da9be813f36fc4ac"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aosguard-linux-arm64"
        sha256 "67832a6152f44ef17090081e93a2326953c089155741b7cb9cb7b1c9c3215e56"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.554.0/aterm-linux-arm64"
        sha256 "cdc666498fe16f803eea34a41e717e89ee67bfd535d8f24b3ad6b38d18cb0f5c"
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
