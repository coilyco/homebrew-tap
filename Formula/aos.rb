class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.561.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aos-darwin-arm64"
    sha256 "885da9e4fdfda863a44909a7c3e6d80f5e947ae3de95f0116419347bccfaabf5"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aoscompose-darwin-arm64"
      sha256 "885da9e4fdfda863a44909a7c3e6d80f5e947ae3de95f0116419347bccfaabf5"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aosguard-darwin-arm64"
      sha256 "15fea1a7a2bb87156f92b1f5455b7831fce799ea65d8bb446bd0ed8d4851585e"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "a8720cc693ebbd6977f3ce07b38fc027690b1038d22bc5009ecc875f16725589"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aos-linux-amd64"
      sha256 "25c767fb0bcd82945c2d35fa431ea362ad801afc3cd7dda2df207f893dbb2419"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aoscompose-linux-amd64"
        sha256 "25c767fb0bcd82945c2d35fa431ea362ad801afc3cd7dda2df207f893dbb2419"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aosguard-linux-amd64"
        sha256 "436747ebb06470be58199876fe65e93f80b50abe54856673abdc139fe5e789a7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aterm-linux-amd64"
        sha256 "59cb0b44e1c8b8cdff762dce1eca77b764e0a497507e3e8746b0c376e8189e4a"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aos-linux-arm64"
      sha256 "48b95d556234a854dd7718d64087d5d7f07774f7e6e9ae1ca3b4bc9945b8434d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aoscompose-linux-arm64"
        sha256 "48b95d556234a854dd7718d64087d5d7f07774f7e6e9ae1ca3b4bc9945b8434d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aosguard-linux-arm64"
        sha256 "2c0ab2c06ab202c4959f5465cf676641e6382c14b69670fe471cbce3b1b897dc"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.561.0/aterm-linux-arm64"
        sha256 "b071737db3fe038d7d1e812e2ca298de85482e9bca2ec47787a2bce14d561146"
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
