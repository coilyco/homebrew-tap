class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.614.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aos-darwin-arm64"
    sha256 "dae6a97b696110cd4c9059b92c183d9c7510e53b90b3689b4de2fa3a8a3ba5c0"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aoscompose-darwin-arm64"
      sha256 "dae6a97b696110cd4c9059b92c183d9c7510e53b90b3689b4de2fa3a8a3ba5c0"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aosguard-darwin-arm64"
      sha256 "3bf478874b5179663bd8e67b03f51680ce61f9df839ea04f6f37f3b17e87538b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "c7bf5a04fdf89b37151247a2a0adb04e6eece3587fb330168f2bab80a5dd9002"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aos-linux-amd64"
      sha256 "66c89083c2e0244ed197820bd99498b53ebcf0a9461aa7d6ed1e5d773cac1968"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aoscompose-linux-amd64"
        sha256 "66c89083c2e0244ed197820bd99498b53ebcf0a9461aa7d6ed1e5d773cac1968"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aosguard-linux-amd64"
        sha256 "a59abc8757f3c975517ad408aac8083820172413a7a22ca5dac61eb606701e3a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aterm-linux-amd64"
        sha256 "779e766538a537489f85923e4d3b0d5cf68ed6db9dc61e5682b75644994fbfd3"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aos-linux-arm64"
      sha256 "5dff4113feb7123959a17c42ecd4d24fd187bece62701da753341db0fe9ecf65"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aoscompose-linux-arm64"
        sha256 "5dff4113feb7123959a17c42ecd4d24fd187bece62701da753341db0fe9ecf65"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aosguard-linux-arm64"
        sha256 "6be20c4cf91914e0a3a45501ba45a43237d7e4eb680366fafbfa30a16d35876c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.614.0/aterm-linux-arm64"
        sha256 "931c7c1b963d7a062fe52b71a650b13dbcca109fae7714a5a3a3b7a39af61952"
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
