class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.581.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aos-darwin-arm64"
    sha256 "bf119678211ea09acc2782bc4da2753ebd8acf0e3f29138ac8ff452f42de5818"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aoscompose-darwin-arm64"
      sha256 "bf119678211ea09acc2782bc4da2753ebd8acf0e3f29138ac8ff452f42de5818"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aosguard-darwin-arm64"
      sha256 "4b562466b8cc93caff4466a80a68594bb32eaf3b73256b2daa9f81d25e24abed"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d19fc0016adaa0a1e22496b5b237028b547c63cb8a53a719e0487b0657501a62"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aos-linux-amd64"
      sha256 "517bb88d3ccfc2a15d5d4ba633112e935b86ff2e756d96efed13a446e98bdcdd"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aoscompose-linux-amd64"
        sha256 "517bb88d3ccfc2a15d5d4ba633112e935b86ff2e756d96efed13a446e98bdcdd"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aosguard-linux-amd64"
        sha256 "e72f3952dece2495be282c504af48916cbc5810c9b4c433dd10aab3d3fc557db"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aterm-linux-amd64"
        sha256 "36cd60c8046727050c5896dbd076857d353ab8726b6d0cf3deb10a189e9d7ab7"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aos-linux-arm64"
      sha256 "4ec49904bb8232be193e62ce5ddc0cef03e40bb16f33017f277e5699e9cc3a14"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aoscompose-linux-arm64"
        sha256 "4ec49904bb8232be193e62ce5ddc0cef03e40bb16f33017f277e5699e9cc3a14"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aosguard-linux-arm64"
        sha256 "538cedfedce8c99e366d776067df1d4079801120c025a22cd55e7be5cba7c22b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.581.0/aterm-linux-arm64"
        sha256 "ff51217d6f25217bd39b2221eac7ec473c4de5cbb30a535fd9b5f8114b8b9663"
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
