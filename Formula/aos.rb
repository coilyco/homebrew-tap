class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.558.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aos-darwin-arm64"
    sha256 "32bbb2da5ebe4458dcd5f135a287dd67f86959aba4db373766ceeee9fe8e4f23"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aoscompose-darwin-arm64"
      sha256 "32bbb2da5ebe4458dcd5f135a287dd67f86959aba4db373766ceeee9fe8e4f23"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aosguard-darwin-arm64"
      sha256 "350a13255508e572785ec068c52bb3620b953a45b49cf479944b323b248113f6"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "fec6d9f12284e3fe075c7c712c9134121d7ffa8291a5ad906b8717b94db32d84"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aos-linux-amd64"
      sha256 "6a7b0311cd5f78cd0fb2187f1f9270867f221f537fd0c1c9dd1aac01ec9b9568"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aoscompose-linux-amd64"
        sha256 "6a7b0311cd5f78cd0fb2187f1f9270867f221f537fd0c1c9dd1aac01ec9b9568"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aosguard-linux-amd64"
        sha256 "d7a41a4b3af4f06dfbca121d1d4dacd2d619ef8a6e072ee9df842113085c4603"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aterm-linux-amd64"
        sha256 "416878a34ccbb5d47e32334bed65b85293ec14c2ae131e5e36a8a9cb3616fbac"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aos-linux-arm64"
      sha256 "9afc3f50dc59a4052a520d9fdc24874514931b589e3c1bd03bbd71c4bc391704"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aoscompose-linux-arm64"
        sha256 "9afc3f50dc59a4052a520d9fdc24874514931b589e3c1bd03bbd71c4bc391704"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aosguard-linux-arm64"
        sha256 "db281c89ba3d0ce8bbe564ee24e5f09a5d9a78f4eff14bff315bbdb204f1b335"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.558.0/aterm-linux-arm64"
        sha256 "c6f5b3e676c566eaf9d4d7159971f9ce83fd8da884e3e7b37fb75da33e684d4e"
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
