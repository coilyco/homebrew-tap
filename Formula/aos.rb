class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.631.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aos-darwin-arm64"
    sha256 "5d97bd5741c1f946c2edc3c8b6c67274beac57a8f8028b9bf44ae08e1333a5f6"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aoscompose-darwin-arm64"
      sha256 "5d97bd5741c1f946c2edc3c8b6c67274beac57a8f8028b9bf44ae08e1333a5f6"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aosguard-darwin-arm64"
      sha256 "9f087a1e78e8caed9924ff4b5dbd6a0a6a2a525d22fb87b3661d1288f6ee6d43"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "7c3355e8e0b3f3fad5c22fe790913fdb7f5a864bfc26f4bf096dc25e9fc32451"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aos-linux-amd64"
      sha256 "f2f32b2cb3c8ddfec6375fd73ce627a2bccb49c2c944b274df1fcc30326fedf4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aoscompose-linux-amd64"
        sha256 "f2f32b2cb3c8ddfec6375fd73ce627a2bccb49c2c944b274df1fcc30326fedf4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aosguard-linux-amd64"
        sha256 "b07fa88e9e4c44ba86fe4558dd465df7cf602f46f2f09e900c18a05390a9b560"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aterm-linux-amd64"
        sha256 "1a40dcb8e2fc0bdf5648be7f21ccde95284de7d84f3cd20b07bfd42784857e3a"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aos-linux-arm64"
      sha256 "97b03b5447caf71dffb563ffdd69830c3abaeadbff58364b77bc0e8a98c3ec16"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aoscompose-linux-arm64"
        sha256 "97b03b5447caf71dffb563ffdd69830c3abaeadbff58364b77bc0e8a98c3ec16"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aosguard-linux-arm64"
        sha256 "a548bdc345dc90d882c61bc701b2cd4ac4e81ee03ea129f8488614953ddb0f20"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.631.0/aterm-linux-arm64"
        sha256 "4dd6d103cb479928ad33a6cd4df974c04c74e576f7f43dd651cb32afdd5b8b20"
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
