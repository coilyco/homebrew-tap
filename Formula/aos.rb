class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.519.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aos-darwin-arm64"
    sha256 "858509c2f41d6364fdec7148023c369f010dae2d8344e1de3293155381e00adc"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aoscompose-darwin-arm64"
      sha256 "858509c2f41d6364fdec7148023c369f010dae2d8344e1de3293155381e00adc"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aosguard-darwin-arm64"
      sha256 "672dab603ed5763b011f114ef40c8ec2316c2585d3127c68b885152dfb10eeb3"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "aaac3ac2bac67dcf68fea2a17561224e39b35fc7ce435503310ff005d5e02bab"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aos-linux-amd64"
      sha256 "f615817eeefb6629ec46eade54c764ffb1e2a399e6e6c3075e157ffaf0990c79"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aoscompose-linux-amd64"
        sha256 "f615817eeefb6629ec46eade54c764ffb1e2a399e6e6c3075e157ffaf0990c79"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aosguard-linux-amd64"
        sha256 "526a63a6dee67415d4f8302dbaa93a4a3f16c3388b11ba30156a5e760d3858a6"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aterm-linux-amd64"
        sha256 "286a8b40b7a2eed0c2e14ba6bd340b2625e5cc2c91001936cc76c68d8ab361f0"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aos-linux-arm64"
      sha256 "74700c1e563bd7c250f0dff2508d1b9e8ba241e62902738f951e799ac7b16885"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aoscompose-linux-arm64"
        sha256 "74700c1e563bd7c250f0dff2508d1b9e8ba241e62902738f951e799ac7b16885"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aosguard-linux-arm64"
        sha256 "ac32213b9abdae57e0047a96fea225c41581eb84e81a44261863c7e46451782c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.519.0/aterm-linux-arm64"
        sha256 "6328c785d8362b85a15992904e9ad39b0692e0066ef1bd29d958257813b1bcb6"
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
