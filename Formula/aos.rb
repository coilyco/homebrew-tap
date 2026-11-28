class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.642.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aos-darwin-arm64"
    sha256 "156ae5ea17449d8bb8af9326a22e2de0449d68e01bb99e69d5a84caaf0efb61b"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aoscompose-darwin-arm64"
      sha256 "156ae5ea17449d8bb8af9326a22e2de0449d68e01bb99e69d5a84caaf0efb61b"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aosguard-darwin-arm64"
      sha256 "b3d5a28c96a25824e3f478f741332f8c9c8b06689d748c350f2cb857ecf27ec5"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "4d1b435c28052cce4ca934f648fb4c1597b0c58cc6948f14f439364e8473908e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aos-linux-amd64"
      sha256 "6eb97514fa1f260784b54d0f6422119a2568bedf2770876c6b048111954dade6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aoscompose-linux-amd64"
        sha256 "6eb97514fa1f260784b54d0f6422119a2568bedf2770876c6b048111954dade6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aosguard-linux-amd64"
        sha256 "3c8bccfe3fc2282a2aa547d51c68e39c7748170e37ac4cc85d392501b579370d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aterm-linux-amd64"
        sha256 "74defb26c421063285ce77e78c4b38f040e8d814ea25b514a6e143ff0bb10125"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aos-linux-arm64"
      sha256 "f7fa7ba99a4016c2bb03a6f6533d0a4540f40884a9ef06a4b08c6c5eb9b6b1ba"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aoscompose-linux-arm64"
        sha256 "f7fa7ba99a4016c2bb03a6f6533d0a4540f40884a9ef06a4b08c6c5eb9b6b1ba"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aosguard-linux-arm64"
        sha256 "110272945ba2d022e0a36a0b53dc71cfc645ad7062a601f1e4d67b0197fb8753"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.642.0/aterm-linux-arm64"
        sha256 "25355ff233e94776a065cf8197cab676135c8599196792daf5474a5ddefd66e2"
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
