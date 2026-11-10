class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.569.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aos-darwin-arm64"
    sha256 "8fdd6c481e9581a68393d9451a0b6d9c0bafe2ff57d3ed6334e5dc835e8c6b3d"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aoscompose-darwin-arm64"
      sha256 "8fdd6c481e9581a68393d9451a0b6d9c0bafe2ff57d3ed6334e5dc835e8c6b3d"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aosguard-darwin-arm64"
      sha256 "3f187ec6175c506a41d7c5ac5c3ac16cdde963c664cdd788555a994129d90247"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "7743bc48e289e9d011e292f0f3cfe126c7870f1c1a9de7f3df4d62d78dea7f92"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aos-linux-amd64"
      sha256 "7c9e3f3cc3c1ccde9825393fa5e7427ea8345962fb1a34eb7c9a3ccf0b5b862b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aoscompose-linux-amd64"
        sha256 "7c9e3f3cc3c1ccde9825393fa5e7427ea8345962fb1a34eb7c9a3ccf0b5b862b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aosguard-linux-amd64"
        sha256 "6fcf3d8bca57285a94dfd2b9f044f5c895d16a65158c12494eacc423c39b9ce7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aterm-linux-amd64"
        sha256 "ff5c1f1caabee556457a40992b1b3aa7959943c5d2f026ed9b0fcf075de3f6a2"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aos-linux-arm64"
      sha256 "8d8c3471b1fb424ee036ec4e88811adb888cf2cbdb7b7d360db08546cdf72f4f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aoscompose-linux-arm64"
        sha256 "8d8c3471b1fb424ee036ec4e88811adb888cf2cbdb7b7d360db08546cdf72f4f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aosguard-linux-arm64"
        sha256 "32da14a89cf902b77e4e4f17d189db0d2d251031f90aff95cb981750facd53a5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.569.0/aterm-linux-arm64"
        sha256 "3c2bd6b387f9ea2ec03cc9c9abb877c4a5a972883cc42dfc730f4f2f0ef3cf1b"
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
