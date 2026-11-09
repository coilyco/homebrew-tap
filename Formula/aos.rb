class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.552.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aos-darwin-arm64"
    sha256 "20daac89d8b760e93a252acedd380ab25a59974c1429c70460608f8abbaf9c32"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aoscompose-darwin-arm64"
      sha256 "20daac89d8b760e93a252acedd380ab25a59974c1429c70460608f8abbaf9c32"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aosguard-darwin-arm64"
      sha256 "6b4989aa5e03627769b769af9e89699665504e1b6eb5c3f0b08f061195d04373"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "0765c3b440cde3451e4fb0a6aa2063ca146146b0366acd544aa1cf84e0ca280b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aos-linux-amd64"
      sha256 "ac99a4087b138d7b6686e01bd513f77f90d954b90a4da94fafaca0cac3110f3e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aoscompose-linux-amd64"
        sha256 "ac99a4087b138d7b6686e01bd513f77f90d954b90a4da94fafaca0cac3110f3e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aosguard-linux-amd64"
        sha256 "045de8c1ded6f15760c7725ef0bc4aeb6b146b7d6c4927cf79951a355ec28400"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aterm-linux-amd64"
        sha256 "ebcf53e6c2fa7ef892be44061d3a289b7193f2acb34feafe8bbe269d2f6ea78e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aos-linux-arm64"
      sha256 "6e2310062206cac8c2a16928aef31186c7a069315dc066e00272d52727178a9f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aoscompose-linux-arm64"
        sha256 "6e2310062206cac8c2a16928aef31186c7a069315dc066e00272d52727178a9f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aosguard-linux-arm64"
        sha256 "240c006fe84e957eff92ce223271ebacd6ea80ab0cd21b56b447c6db498c6c3d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.552.0/aterm-linux-arm64"
        sha256 "c56d7b335a00e764596855381a8f56bfefe370fa8b34350c3c3a60c1f357c792"
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
