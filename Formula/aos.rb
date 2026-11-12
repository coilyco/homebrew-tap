class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.618.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aos-darwin-arm64"
    sha256 "69d8d71d6cbd8fbb6478e28c2c2b6fff1e01f5ee90fd465d05bbf9ef48c812c5"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aoscompose-darwin-arm64"
      sha256 "69d8d71d6cbd8fbb6478e28c2c2b6fff1e01f5ee90fd465d05bbf9ef48c812c5"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aosguard-darwin-arm64"
      sha256 "09979daa6e914fb9a3cc07b0f6af93ba110c1b9bf6dba43644649c763311e0b5"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "539681ebcd74dc8d9b7d3e4720346adf04f004e4f8b81d3ae7e1dda2e585a7f1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aos-linux-amd64"
      sha256 "1655db5227183dd33fda231cf2ac8f2284cd02f3528fa11935b5858bf28a1e13"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aoscompose-linux-amd64"
        sha256 "1655db5227183dd33fda231cf2ac8f2284cd02f3528fa11935b5858bf28a1e13"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aosguard-linux-amd64"
        sha256 "a13623c062ec21aac72af48ed24939debd2d44876c6f37c21fd3565b4f84ce9b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aterm-linux-amd64"
        sha256 "a537c3612335fc78030a794ba73c0c9c97ad96568e97ac1756e7f52bdee9a42e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aos-linux-arm64"
      sha256 "968fc6a4a83d90db60c3aab41d391b0c67b69beb59676677bd19ce66c2d8a5d0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aoscompose-linux-arm64"
        sha256 "968fc6a4a83d90db60c3aab41d391b0c67b69beb59676677bd19ce66c2d8a5d0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aosguard-linux-arm64"
        sha256 "b09590ba928e023b444f0795c1e71b780218f359f88bb302b0abb5255970cd37"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.618.0/aterm-linux-arm64"
        sha256 "d7f8c6395c27dcbfc1a895ec3778e6ebcdb2e3d9f67dcf0497eea7dc6426eca6"
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
