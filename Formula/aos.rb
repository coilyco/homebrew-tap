class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.609.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aos-darwin-arm64"
    sha256 "e5db503ab61e810a670b4b843412584a2e182e1edd82004171f3965bcc262cf8"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aoscompose-darwin-arm64"
      sha256 "e5db503ab61e810a670b4b843412584a2e182e1edd82004171f3965bcc262cf8"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aosguard-darwin-arm64"
      sha256 "8f8a138da7680d64beac5c3275815cfc2fbb5b74da40df053ff71082677f45ce"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "082c1058c57a01dfe068dba13a278099c479684ab45a6b753f143f225540f208"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aos-linux-amd64"
      sha256 "98adbb9f93be79599d3205b5d49cf518c2ad6dc639d6b40a18f52f5cfed49374"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aoscompose-linux-amd64"
        sha256 "98adbb9f93be79599d3205b5d49cf518c2ad6dc639d6b40a18f52f5cfed49374"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aosguard-linux-amd64"
        sha256 "25d260b3aa920ea6a5a0079d889fc5ae2036fb59095c51bf2ff02020d1e9d00c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aterm-linux-amd64"
        sha256 "d419de05fb18cb064f6521fbad3055e1d9da434260477ee7fbca64715289fbdb"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aos-linux-arm64"
      sha256 "2f015bbb5c4c99a8b7d251c0c3f72e257166b1b5c8e98b4c7960a3a06dead567"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aoscompose-linux-arm64"
        sha256 "2f015bbb5c4c99a8b7d251c0c3f72e257166b1b5c8e98b4c7960a3a06dead567"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aosguard-linux-arm64"
        sha256 "e4ce70af8af9f001e73ad6947c8b1aaaceec32f31c70f1008b02ccfdd4f56170"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.609.0/aterm-linux-arm64"
        sha256 "38c20b4b8b4e441b4dc3c1972d9b4e3fd69352012d601ef05fc628119e84c1dc"
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
