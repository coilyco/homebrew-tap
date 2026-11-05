class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.529.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aos-darwin-arm64"
    sha256 "4273621f2687ce5391854c3b8169e0d44ffd295a35e9389a8003f45e8c84724a"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aoscompose-darwin-arm64"
      sha256 "4273621f2687ce5391854c3b8169e0d44ffd295a35e9389a8003f45e8c84724a"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aosguard-darwin-arm64"
      sha256 "da3bf22784a16fce6f26423e173c57d4b82123382886fdc542d0f35bb1382c57"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "2383872b56ee028dc4ed07757521eea7db185197020bcb8aa7710c87488f8809"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aos-linux-amd64"
      sha256 "5666b6fef4561fffaa7383f5ffb80708df0f18d7295814ed4f08bc73e19bdda2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aoscompose-linux-amd64"
        sha256 "5666b6fef4561fffaa7383f5ffb80708df0f18d7295814ed4f08bc73e19bdda2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aosguard-linux-amd64"
        sha256 "c4c02e4394d17bb35c4690414454b00617e07a8982c053f1a3b4dfad36a2944b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aterm-linux-amd64"
        sha256 "cdc4ef3690b9ef821a34899ac348fc7fcccfcc30c4721b0b9ea90095bbc0e209"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aos-linux-arm64"
      sha256 "35c834673cf6d7a67506dbc3154018c51f9551276d85a30d27249e4c9cad4adc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aoscompose-linux-arm64"
        sha256 "35c834673cf6d7a67506dbc3154018c51f9551276d85a30d27249e4c9cad4adc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aosguard-linux-arm64"
        sha256 "13892e508d8f14fe67e77b2d21a203301ef67160ea809eded052334ad9a8a725"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.529.0/aterm-linux-arm64"
        sha256 "1d5ed85b5196c6523f55ea1d57c7c18a6f14c97c9916dec0b18384c680146faf"
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
