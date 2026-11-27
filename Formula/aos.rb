class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.635.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aos-darwin-arm64"
    sha256 "d52db4acc5e20aae1769cf156fcc0236d70b9fe69f70c1614bcf8545637189dc"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aoscompose-darwin-arm64"
      sha256 "d52db4acc5e20aae1769cf156fcc0236d70b9fe69f70c1614bcf8545637189dc"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aosguard-darwin-arm64"
      sha256 "82b7ff299f0f07f5f7942789173b0446d904ea0ff81d7ed78537b9a97fe5a3df"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "b67a241b58c1240f0fdf4bf7fc56155fd7da3d44c341fbe8f15134706f444696"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aos-linux-amd64"
      sha256 "349a125feb38603fa1f45dacc9502d0767dd7349ebd1f37cb4e0ba899e022f83"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aoscompose-linux-amd64"
        sha256 "349a125feb38603fa1f45dacc9502d0767dd7349ebd1f37cb4e0ba899e022f83"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aosguard-linux-amd64"
        sha256 "469b9a75207b3b545abf54b7e4f88e11f4a9ff5d1bdaae9c6866d0b9c8e988e0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aterm-linux-amd64"
        sha256 "053359bdf998ac8b02f769449c208fc0e463e16d9a025b35e75fa6809912f177"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aos-linux-arm64"
      sha256 "17d9715e31390a6974d52561f4e4af66cbc736b5ca5a474dfbfb3432ea6d3822"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aoscompose-linux-arm64"
        sha256 "17d9715e31390a6974d52561f4e4af66cbc736b5ca5a474dfbfb3432ea6d3822"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aosguard-linux-arm64"
        sha256 "54676a72478ab1f937276a5efe41ecb3ecc6c5c0a62d5180574f878fe25eb40b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.635.0/aterm-linux-arm64"
        sha256 "79e9fb6759b56e3904f5f0ffc18d8f607795e453228437ecc3fd8efeb0f66091"
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
