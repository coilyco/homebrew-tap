class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.537.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aos-darwin-arm64"
    sha256 "3c2502fa63bf240cb1afe586d1abf46f936e897cd8f313e8723613a2d7d269c6"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aoscompose-darwin-arm64"
      sha256 "3c2502fa63bf240cb1afe586d1abf46f936e897cd8f313e8723613a2d7d269c6"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aosguard-darwin-arm64"
      sha256 "afea1344137f39bfd2cb9371e7396f01fff76b756f7121aaf1fc14a4ff875c4c"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "ee2c571f206b1b6fd5d5b524a44ecb4fbdb2874edfcff659725b726e27fbb53c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aos-linux-amd64"
      sha256 "42a2e0b00a3425056e75c04770f4e8a9b000363ab910e07badf01937c5a08ddd"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aoscompose-linux-amd64"
        sha256 "42a2e0b00a3425056e75c04770f4e8a9b000363ab910e07badf01937c5a08ddd"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aosguard-linux-amd64"
        sha256 "14ec8ae55a75d2015608585a6217792d105321b995f60ecd0aefd51f1bac4586"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aterm-linux-amd64"
        sha256 "731e5e9b1930814b1986309f3ec48ed84257ef24f3bf8f33a0322cb2428d93ae"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aos-linux-arm64"
      sha256 "3ca6d059a5ec37593ac7dbb1f0dcfb87c14bd6cebde49a02452d891c5310b1b4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aoscompose-linux-arm64"
        sha256 "3ca6d059a5ec37593ac7dbb1f0dcfb87c14bd6cebde49a02452d891c5310b1b4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aosguard-linux-arm64"
        sha256 "e56e47bd4879f75f58b9fc57749028cdefcd9b106ae5de37656d4f4a507ce39a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.537.0/aterm-linux-arm64"
        sha256 "c0be2965ff60159159cf1343da7861dcdd42b7354eb902406904a21851a00677"
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
