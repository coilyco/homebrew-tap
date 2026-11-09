class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.549.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aos-darwin-arm64"
    sha256 "e711522570a2b5a26a5c52ddd94bf6687031cd1b610a1647f97019b7db682bf7"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aoscompose-darwin-arm64"
      sha256 "e711522570a2b5a26a5c52ddd94bf6687031cd1b610a1647f97019b7db682bf7"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aosguard-darwin-arm64"
      sha256 "e81f8c742740e17530b62e4fbab5ede484af88236da632362b1061098e79771a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "f5ecf8caa2d0d1c22691da236cc33dbbc5818ff7639c883e0eb7af9b40aea11f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aos-linux-amd64"
      sha256 "680ef571fcc7c562f4a0ff276ccf4658f724ea8d8271f20fdca6a4d467f61358"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aoscompose-linux-amd64"
        sha256 "680ef571fcc7c562f4a0ff276ccf4658f724ea8d8271f20fdca6a4d467f61358"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aosguard-linux-amd64"
        sha256 "ed28e57579b010e1881fc9c37165ef94f53275d06bc8a634f4fcf887b32f9475"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aterm-linux-amd64"
        sha256 "0c1a300cf446fd77bf7cadd2bd0a83744c21bfedca0f927e283ab14e0ed547fa"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aos-linux-arm64"
      sha256 "59d86de0640f83689922e5fe153364cac6deb0838d2a76cecdca98524790b6de"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aoscompose-linux-arm64"
        sha256 "59d86de0640f83689922e5fe153364cac6deb0838d2a76cecdca98524790b6de"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aosguard-linux-arm64"
        sha256 "f9d6c5e5f888428b2788a9f139eaee5ac77337accebeff298eeece361b729987"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.549.0/aterm-linux-arm64"
        sha256 "04ab0930f844c32da44786075bb1668d5846de8f257c1f8a87b6127c93ea113f"
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
