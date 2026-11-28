class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.641.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aos-darwin-arm64"
    sha256 "aa942f753335ec460fc0429931cc14a1a867d946a9fbd10cc8f02145842d27a2"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aoscompose-darwin-arm64"
      sha256 "aa942f753335ec460fc0429931cc14a1a867d946a9fbd10cc8f02145842d27a2"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aosguard-darwin-arm64"
      sha256 "9429fb8ae62906896dbdd31e2c19279f46b78b2d7296134402c30a36428274dc"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d10f4670cd9e4e5586c8bde6cff3bd55f3a184f8c35ac97c69d2f8a3436896ef"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aos-linux-amd64"
      sha256 "4573e7418527dadcfa42ed6ae6fc7726d49ba13a53ead443749c87e962e6f713"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aoscompose-linux-amd64"
        sha256 "4573e7418527dadcfa42ed6ae6fc7726d49ba13a53ead443749c87e962e6f713"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aosguard-linux-amd64"
        sha256 "b089eddcea0cac7963030b13277078d24d1b8079653e115ef63470e4aa554489"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aterm-linux-amd64"
        sha256 "3ee89d6038db7cccbad4b979a810289d3f0144443046cdf363dc5323047c81b6"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aos-linux-arm64"
      sha256 "4c418d5881725977bcf4c45aee97a5ee3d5c54b0ec3105b6a4083e6bfdc47f8d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aoscompose-linux-arm64"
        sha256 "4c418d5881725977bcf4c45aee97a5ee3d5c54b0ec3105b6a4083e6bfdc47f8d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aosguard-linux-arm64"
        sha256 "edba730a41f0023059b5024caad7411155f46c126ee64570d5630792affc82ce"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.641.0/aterm-linux-arm64"
        sha256 "36e180d7f84903be1f0243a97fb7690a9cc6d1739bf26f65eec0271743f43a22"
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
