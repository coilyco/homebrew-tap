class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.579.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aos-darwin-arm64"
    sha256 "93a358cd8a3d04eaa426fdb04b557e1df50e8923b691ef4ba59fb4668eb3f9ef"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aoscompose-darwin-arm64"
      sha256 "93a358cd8a3d04eaa426fdb04b557e1df50e8923b691ef4ba59fb4668eb3f9ef"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aosguard-darwin-arm64"
      sha256 "f4460bdf38c82a79e513783cbc4cc3eb145a7d48d2eb9562fe9f112a54e49b09"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "c6840e81983e1ea1acc5087d5b722bf56effbfcf0c69546cfd01715f0bf16a89"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aos-linux-amd64"
      sha256 "3d79b73ff768e7d74eafef808700603970f2c6d9344279988dd4b04713c5a0fa"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aoscompose-linux-amd64"
        sha256 "3d79b73ff768e7d74eafef808700603970f2c6d9344279988dd4b04713c5a0fa"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aosguard-linux-amd64"
        sha256 "9512f8a450a3e7d32e152672be067661e008581f5b45473843a8be9ef0e250c8"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aterm-linux-amd64"
        sha256 "5364e164c3fd00d5366e389d5fb9aeaadadec6f2b68b82ed2a17247c60084a5d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aos-linux-arm64"
      sha256 "0e6a7b0ccf14b11f7875046063b148d98a2980cd8367d1623ef22cc913a8a717"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aoscompose-linux-arm64"
        sha256 "0e6a7b0ccf14b11f7875046063b148d98a2980cd8367d1623ef22cc913a8a717"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aosguard-linux-arm64"
        sha256 "41592d86dac8635cba98725a2a860f87fdf74f6a6c5297ab206011a2f1c297e7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.579.0/aterm-linux-arm64"
        sha256 "b5caac3ee9a894c5cfb18d5d5fed6b5ded9e3dd5ed620e38c27a32596148d7ad"
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
