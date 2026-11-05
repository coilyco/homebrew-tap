class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.521.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aos-darwin-arm64"
    sha256 "bd29bf7659b8a6e74d5b36a9f5013e129f94a597d930ba7625930f6a9007e5fa"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aoscompose-darwin-arm64"
      sha256 "bd29bf7659b8a6e74d5b36a9f5013e129f94a597d930ba7625930f6a9007e5fa"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aosguard-darwin-arm64"
      sha256 "59c683c26cb143df549762cff1e48e57a997f1ccc6e05c29ba59226f5d8b21db"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "0de884d8db7ba79496610b72d01e0894a9b837c60c558385ed4585487bb7da09"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aos-linux-amd64"
      sha256 "1f859344c6df9aa282bb3d777d7ae6ba851d44df19f204640a6e565fb5b7bbcc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aoscompose-linux-amd64"
        sha256 "1f859344c6df9aa282bb3d777d7ae6ba851d44df19f204640a6e565fb5b7bbcc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aosguard-linux-amd64"
        sha256 "461424da2934becf769d93996e14855a4d77e52a79fcc67d646e9c6fb9f7c961"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aterm-linux-amd64"
        sha256 "e150c09f19884996387cc13299e7ce3618a59b93c0c732a06a0dd803eb3dbfb8"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aos-linux-arm64"
      sha256 "00ff5f6cc6e22838d956fdcb63b76da974ca8ad78ca2cd3447934770bcad15fc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aoscompose-linux-arm64"
        sha256 "00ff5f6cc6e22838d956fdcb63b76da974ca8ad78ca2cd3447934770bcad15fc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aosguard-linux-arm64"
        sha256 "6ae93e1455dd5aa2ba7f3041673dd19e3368a5aba44959d5f7890fa4851646c3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.521.0/aterm-linux-arm64"
        sha256 "b9ee1634ac9a176b1d1ad5503fbdc6761cebfed5726420d385428a9fc517c852"
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
