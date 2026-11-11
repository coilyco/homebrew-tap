class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.610.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aos-darwin-arm64"
    sha256 "cd99f54fabdbfe35721953d9019c8cc2679f85941b06997543cd9edee8243c43"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aoscompose-darwin-arm64"
      sha256 "cd99f54fabdbfe35721953d9019c8cc2679f85941b06997543cd9edee8243c43"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aosguard-darwin-arm64"
      sha256 "546e7be412fe1ff79875f108a569d7fca9ee3535d49e053b0c16017ebba49e5c"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "c892f525d5fa63af5bca4165ae2ec4c182191b597851eada7ba501dfa6c9d762"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aos-linux-amd64"
      sha256 "173c03d10bb9c2fc58da1d92c44594b5926ccf041c9171f54f5a15cf54a470b8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aoscompose-linux-amd64"
        sha256 "173c03d10bb9c2fc58da1d92c44594b5926ccf041c9171f54f5a15cf54a470b8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aosguard-linux-amd64"
        sha256 "2fef3743f50afcb747776c5b99bbe88bd2ae669117bd798ba671afa2a8891569"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aterm-linux-amd64"
        sha256 "713e945c3cacc05e08fc7bbe3c2cc2ceb9d8523f1135968f8ad3866b42047191"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aos-linux-arm64"
      sha256 "c9d64bf36026571e7d0166043541cee1081f7ae2301f8c32e4e8ebe5dc9a0330"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aoscompose-linux-arm64"
        sha256 "c9d64bf36026571e7d0166043541cee1081f7ae2301f8c32e4e8ebe5dc9a0330"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aosguard-linux-arm64"
        sha256 "b23a262dc996a11443a636366c1edf95a824fe23779006595513fab299edea2d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.610.0/aterm-linux-arm64"
        sha256 "2e1572846d8e77091060ccb90cc4122028fc75dce287ec81838db35b30a91b26"
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
