class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.644.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aos-darwin-arm64"
    sha256 "8e7018468559ea2980b7b3e97a9f56337c968a337f7bc2e7f551c890b9bd2bd5"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aoscompose-darwin-arm64"
      sha256 "8e7018468559ea2980b7b3e97a9f56337c968a337f7bc2e7f551c890b9bd2bd5"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aosguard-darwin-arm64"
      sha256 "b16b01ba524a63edace85888439055a363e75f22c4b73c73810e311c2d2da47c"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "438fd103ed9a072cceab129f513b3ed0e8b093e93e7f28dd18958d4ee99dacf0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aos-linux-amd64"
      sha256 "05ed57d1e62fe00e34e157b74a21768b8ec513dc0e52fd5cdac0217a753f5b5c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aoscompose-linux-amd64"
        sha256 "05ed57d1e62fe00e34e157b74a21768b8ec513dc0e52fd5cdac0217a753f5b5c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aosguard-linux-amd64"
        sha256 "bf5e8c9154ba9e0eb439601bd87283b3eac6edeb7508fc264ce968767d08ec6f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aterm-linux-amd64"
        sha256 "cdc908f558dbf788cc303268579ae00c44af6b104c7006180bf00affb72b29b7"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aos-linux-arm64"
      sha256 "b332daef42542af6712c55db0a7952045052f792f2b0c02737607e41d982cbb6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aoscompose-linux-arm64"
        sha256 "b332daef42542af6712c55db0a7952045052f792f2b0c02737607e41d982cbb6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aosguard-linux-arm64"
        sha256 "ba749fa72e2ca83fd5f5a45d2b66282fa69a494cc577bea402b9f3657f3d0a6c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.644.0/aterm-linux-arm64"
        sha256 "ef290fa84cb1007f0a6d7d52cad19ccc54f043af94abd7080b74000b857b412b"
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
