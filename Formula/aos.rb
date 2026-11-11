class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.588.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aos-darwin-arm64"
    sha256 "7ab1f473fe699eaa0718ebdc111d549c3a8f03d36273b3f480fd43360607daa0"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aoscompose-darwin-arm64"
      sha256 "7ab1f473fe699eaa0718ebdc111d549c3a8f03d36273b3f480fd43360607daa0"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aosguard-darwin-arm64"
      sha256 "2eee354a9fac18e06d62baf4b40fe57ab6e5c4e284efa865947a093adb76a71c"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "e42f6cea0e6dc2f64869f10328a1a42c65842b55571748ab6ec33051a97edb90"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aos-linux-amd64"
      sha256 "b6a175b0b5fe0f8690421bd82a0f6d51296351df12e0be64451aa0968da45d6a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aoscompose-linux-amd64"
        sha256 "b6a175b0b5fe0f8690421bd82a0f6d51296351df12e0be64451aa0968da45d6a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aosguard-linux-amd64"
        sha256 "ce202190aa24e1e2665f6b094ed5a061575bae024c9b13732c03f4083f8c0bdb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aterm-linux-amd64"
        sha256 "033b8ae585099ec8af3d9957cc567f7c744f6c907bd30b2e3232fb6f753e459f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aos-linux-arm64"
      sha256 "2ca9c69b319919d622fc76c8b6cea9a95cceba9d2dde501d98545644078af5da"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aoscompose-linux-arm64"
        sha256 "2ca9c69b319919d622fc76c8b6cea9a95cceba9d2dde501d98545644078af5da"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aosguard-linux-arm64"
        sha256 "5a84466b95f762277367737ceec35dd1371ad63f62e67d019934dbd59cd996ec"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.588.0/aterm-linux-arm64"
        sha256 "c7977236347ecb77db9719f455e52818e5e3ac831b7e407adf4127a8e772d5e6"
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
