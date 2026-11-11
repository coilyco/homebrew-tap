class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.608.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aos-darwin-arm64"
    sha256 "c578dec35c2b0b7f2e137fd746e1a2bf8e3cdc3d4c97ee414ef46104b20a9d21"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aoscompose-darwin-arm64"
      sha256 "c578dec35c2b0b7f2e137fd746e1a2bf8e3cdc3d4c97ee414ef46104b20a9d21"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aosguard-darwin-arm64"
      sha256 "ed72631f709bd17844ef0fb3530e167b46503ba355ad5ecd529fe3d4deb0120e"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "80658225db6fc3d3b415277d849e5eefbd29f9e59cd09c7b463f416857172188"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aos-linux-amd64"
      sha256 "b6fc2a35e20860eee89c2887c238f3d9b7c03619e33d780b316d50e10c42efc4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aoscompose-linux-amd64"
        sha256 "b6fc2a35e20860eee89c2887c238f3d9b7c03619e33d780b316d50e10c42efc4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aosguard-linux-amd64"
        sha256 "4def86fc433337185ac211aa724ffc129b93803fcd2eec12cbaf156c820d4e6f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aterm-linux-amd64"
        sha256 "f1fc81236ceb866eddbf847db29a9398204e88bdaae457815025be535a1414eb"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aos-linux-arm64"
      sha256 "ded09d6f4ac2bcb0869f0d33d72d8b0c308386de34b0a9b04091cb73a906fb24"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aoscompose-linux-arm64"
        sha256 "ded09d6f4ac2bcb0869f0d33d72d8b0c308386de34b0a9b04091cb73a906fb24"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aosguard-linux-arm64"
        sha256 "356a304ebe0e3d23aaf2014faf16fb46aa5d77ccbce56b3c27b26f7ad413db6e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.608.0/aterm-linux-arm64"
        sha256 "01cb82748ebbd3880eb2fbc12e2826b3e58ccb1420ac70f74dce297a294283aa"
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
