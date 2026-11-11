class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.585.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aos-darwin-arm64"
    sha256 "758b6d9dd11b5a1a76cf3c8b8b6a37ab3fe6bb2c27f5feac1a271939e7acc955"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aoscompose-darwin-arm64"
      sha256 "758b6d9dd11b5a1a76cf3c8b8b6a37ab3fe6bb2c27f5feac1a271939e7acc955"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aosguard-darwin-arm64"
      sha256 "746c914fb29c92d14e516233100233b525d9cd4b2428a088f17fae9af11bf7de"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "b27ea62f861a6f912682a7b1b077a9fed12afe1661123e098d32a3cef73b03c8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aos-linux-amd64"
      sha256 "c49d652e864419ea2a9d28557c80137a4e08255bffe85491a8499e41dbf6277c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aoscompose-linux-amd64"
        sha256 "c49d652e864419ea2a9d28557c80137a4e08255bffe85491a8499e41dbf6277c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aosguard-linux-amd64"
        sha256 "985cbab43dba7cc2d9b6eead1887081c329adde041f29569705a28a54f01d0ab"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aterm-linux-amd64"
        sha256 "cb5c91654d5e33a2412cb3a01c0aaa00b65ab3c06dd2c94b06c2183bbe1f412b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aos-linux-arm64"
      sha256 "d46b6077f70a267c3e37d157f4480ed7fb996eda2fa339fa4859d3ccda6d026b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aoscompose-linux-arm64"
        sha256 "d46b6077f70a267c3e37d157f4480ed7fb996eda2fa339fa4859d3ccda6d026b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aosguard-linux-arm64"
        sha256 "507e5b093fa7b17b3b32913e6b9c1b1ff6da95008de444959b245f750eec3bad"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.585.0/aterm-linux-arm64"
        sha256 "9ef9d5c4adc9794e124a3d146c3165681839ece3d269fc31804c7c5c5a7fe412"
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
