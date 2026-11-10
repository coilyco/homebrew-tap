class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.568.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aos-darwin-arm64"
    sha256 "feb1cbc1abac635d13881808b9a927dcdb9819593a9353bf9f3effb00b453bc8"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aoscompose-darwin-arm64"
      sha256 "feb1cbc1abac635d13881808b9a927dcdb9819593a9353bf9f3effb00b453bc8"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aosguard-darwin-arm64"
      sha256 "6e30ead209589679adbdccdcd4af2165bc66daceb809ae2d6c9c2081bb53ffe2"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "1128de0fd69eef4cb096e7ed5b10d6abc0b94891527981341ad06612c1cb8c7f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aos-linux-amd64"
      sha256 "5bcdce5eadb2fd6fb9f14cecde77ae21eb028bc9a9842fdc92191d4a3d6e0731"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aoscompose-linux-amd64"
        sha256 "5bcdce5eadb2fd6fb9f14cecde77ae21eb028bc9a9842fdc92191d4a3d6e0731"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aosguard-linux-amd64"
        sha256 "c229b200f254b93bc7901c81102d2d1c9f9a6d9b5a9bd7a83a5070bf13907bd2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aterm-linux-amd64"
        sha256 "12493b7454bb92d4436143885850591890d750989873f3aa2c8274c6a6ed8709"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aos-linux-arm64"
      sha256 "b320c7ce5f99a696eb7862eed5d7897e428d349c2cdfdcf723ee2b705332167c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aoscompose-linux-arm64"
        sha256 "b320c7ce5f99a696eb7862eed5d7897e428d349c2cdfdcf723ee2b705332167c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aosguard-linux-arm64"
        sha256 "a0326475f631712c50910f5fa877d3781cb2ed69186ed76302933086eb00d235"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.568.0/aterm-linux-arm64"
        sha256 "650ae352f566ed89ba04267739bd85ccb04ec62d4417fcd4af23c994d77725f9"
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
