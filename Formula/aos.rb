class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.632.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aos-darwin-arm64"
    sha256 "bfb6d5f9b59388d64ba2a8517fc375bfb0de76371e7470d621ae6d355f7f02ae"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aoscompose-darwin-arm64"
      sha256 "bfb6d5f9b59388d64ba2a8517fc375bfb0de76371e7470d621ae6d355f7f02ae"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aosguard-darwin-arm64"
      sha256 "9e64ebfe56924b848b844456f19d8205f3bece0b4d443bab98cdba35f1715c33"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "0bffed7d82aaf90b4bb1be73efc0cb1e5c6b9e45b7baa89a308a6c726976fd0d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aos-linux-amd64"
      sha256 "9c05e103ed268476bbeb4c69ed82b1ce99a19ae3b4ec84d87ff317d9f111090f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aoscompose-linux-amd64"
        sha256 "9c05e103ed268476bbeb4c69ed82b1ce99a19ae3b4ec84d87ff317d9f111090f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aosguard-linux-amd64"
        sha256 "c52cf0ed64b806958c2763730d7d98a45d4fa9ae226e62f6513e38058af8012a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aterm-linux-amd64"
        sha256 "31b5ebdaf094882c00069e4cb27d5784186e3c8eb9d9dd8d5bf3d7f586d88bc7"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aos-linux-arm64"
      sha256 "603f6f92e7330a72e7d469a76cb5bcca4575558ff4dc5ae161e603e15cd761e6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aoscompose-linux-arm64"
        sha256 "603f6f92e7330a72e7d469a76cb5bcca4575558ff4dc5ae161e603e15cd761e6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aosguard-linux-arm64"
        sha256 "f7188fedbd65a903c8de441bb2242b242d45633ad52163d8a5d365684ce8db1a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.632.0/aterm-linux-arm64"
        sha256 "9a09efa68ddebd45ce2b9f55b806ee60515a60659adb325cec2b8cae24fa62bb"
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
