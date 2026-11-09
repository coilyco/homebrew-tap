class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.559.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aos-darwin-arm64"
    sha256 "9826cde4ad895966b9d1c986be24d18d988875a46ac4884709bb213025a30695"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aoscompose-darwin-arm64"
      sha256 "9826cde4ad895966b9d1c986be24d18d988875a46ac4884709bb213025a30695"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aosguard-darwin-arm64"
      sha256 "a56e41cc5ece4cb8c82c524a878e362e06c476cb5d2d937db37fe7ee7da1e1c2"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "f73840239f7663bb752d25bc28dc73ed20f67b097fc06212e80e436cde71c0ed"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aos-linux-amd64"
      sha256 "d722e3437c246ac8e8913a68d4e5e9c4f3c4452a7560af1578055ad72d70e027"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aoscompose-linux-amd64"
        sha256 "d722e3437c246ac8e8913a68d4e5e9c4f3c4452a7560af1578055ad72d70e027"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aosguard-linux-amd64"
        sha256 "ddd6302c7a830d9f875eb1bad414ba137996d3bb9d8e31342b4b43d43c8a93d0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aterm-linux-amd64"
        sha256 "9e79761f3d3daad4f64ca06082f50da4be8d7bda2ac38705ced55233a1ea4aaa"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aos-linux-arm64"
      sha256 "889ebfb2bd3d6c7d2b1784cc683cb8621af9662826bad09adaae264d57d129c2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aoscompose-linux-arm64"
        sha256 "889ebfb2bd3d6c7d2b1784cc683cb8621af9662826bad09adaae264d57d129c2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aosguard-linux-arm64"
        sha256 "2f38ab1800dd97724d2a64f615fc94d6ef48d85c60b2a7313f94cd0a2ac897a4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.559.0/aterm-linux-arm64"
        sha256 "a38d8856136a856486ad4a8ecb992b4c58b247736d4dc8e509bdb2b6906dfa2f"
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
