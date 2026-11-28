class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.637.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aos-darwin-arm64"
    sha256 "4e27815a45633f4ff9ceb82c0f58d5bd9f4563fa72b7be0ac894deb343d032b0"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aoscompose-darwin-arm64"
      sha256 "4e27815a45633f4ff9ceb82c0f58d5bd9f4563fa72b7be0ac894deb343d032b0"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aosguard-darwin-arm64"
      sha256 "6ffa584354ebbe6f3d87829e305d64ed9f5abd86e5804cebd987cc15907cc353"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "a4767c7f4011b83572faa3350b729a101e1111c1f18fb28a8fe9b049ad9f0df7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aos-linux-amd64"
      sha256 "896a0659411161c195684553499783fa158e62604b8c75b2fbf847ad60dcffa9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aoscompose-linux-amd64"
        sha256 "896a0659411161c195684553499783fa158e62604b8c75b2fbf847ad60dcffa9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aosguard-linux-amd64"
        sha256 "e6b7ea88368439eb2cfc4ea21c40ef993ecca5de42e80f51853fc96995ee2a5f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aterm-linux-amd64"
        sha256 "67c70e3fcbef2dff2c999305d502eea313ca5d5d3ec1491599a647c7009d288e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aos-linux-arm64"
      sha256 "5e558aabd36e79d8cc8b2fa4499bdabb6d044b2f8b5d0b20fc7d76a181797cd8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aoscompose-linux-arm64"
        sha256 "5e558aabd36e79d8cc8b2fa4499bdabb6d044b2f8b5d0b20fc7d76a181797cd8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aosguard-linux-arm64"
        sha256 "f366d7a00230ea20e9357ed5d238d90f7a3daf02c533cd04b9d434c6d8f51db1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.637.0/aterm-linux-arm64"
        sha256 "6a8266e6833c746f45e141c1949e2e705a1784a0659a797eae4e8b047820b074"
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
