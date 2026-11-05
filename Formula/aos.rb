class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.532.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aos-darwin-arm64"
    sha256 "3c84699dde8fba7d3abf5ce5268d64a1b4cd4b1a3248ec5a303f0210760d9a05"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aoscompose-darwin-arm64"
      sha256 "3c84699dde8fba7d3abf5ce5268d64a1b4cd4b1a3248ec5a303f0210760d9a05"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aosguard-darwin-arm64"
      sha256 "0484db172317f6911f40e048c8b429d3c747b7e6da86b31b49a8a2ab41761ad7"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "35a984d86f73bcb7d748958332e77981b50f2f92de8cf8563126b69d14c0b9a1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aos-linux-amd64"
      sha256 "e0c88c2632b3ed1a8d6ee6c6612b640378287836a0eee6922bb934a61db5239d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aoscompose-linux-amd64"
        sha256 "e0c88c2632b3ed1a8d6ee6c6612b640378287836a0eee6922bb934a61db5239d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aosguard-linux-amd64"
        sha256 "76609df19734e940a2d708d96379bef2c5864099cf0a1d426ebe4e04ffd3fc2a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aterm-linux-amd64"
        sha256 "b059ee80465f1ac255cf69897a2923f71fb00ff075d6dd94aa7c7b059fa715dc"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aos-linux-arm64"
      sha256 "dcba42665135ef99ddda319a4269b3ca80a64e0e4ae25f85076ca8708d28bbf0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aoscompose-linux-arm64"
        sha256 "dcba42665135ef99ddda319a4269b3ca80a64e0e4ae25f85076ca8708d28bbf0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aosguard-linux-arm64"
        sha256 "b5c4f6fb114936167b4479476502593f8a58a8e7ce0385c429155c3fc4ede74c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.532.0/aterm-linux-arm64"
        sha256 "671b0db041dfa34feb4282f6b8c7309f2aa63394c3892bfece54a6be2d81597e"
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
