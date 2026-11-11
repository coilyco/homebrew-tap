class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.583.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aos-darwin-arm64"
    sha256 "4ee6bebda13d7b60852db3e7cec683303d39c5300ab9b6014d217af9e69c44b6"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aoscompose-darwin-arm64"
      sha256 "4ee6bebda13d7b60852db3e7cec683303d39c5300ab9b6014d217af9e69c44b6"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aosguard-darwin-arm64"
      sha256 "9f114afa38aea9a8c9056f6da45df325c14b5abae564b320473ee68d0736cf1b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "88e040792a2544c64225db6efa9b95fe013f5ab06dfe1dac825768cf5a748592"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aos-linux-amd64"
      sha256 "68e0ff69a46e85f3da5f0786914b910edcc002f52c49be93101b1443e47baff5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aoscompose-linux-amd64"
        sha256 "68e0ff69a46e85f3da5f0786914b910edcc002f52c49be93101b1443e47baff5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aosguard-linux-amd64"
        sha256 "92d5955c2fdeedae577699241c72fe5069f7fb76539524e97277803d21497cbe"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aterm-linux-amd64"
        sha256 "8ed8ecaec1392c64e44215aeb3953b993aa6058dc592b5d013280b81aee7daa4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aos-linux-arm64"
      sha256 "3c3892d7d93009ec8175b2b37f3fcf0a08a37158cb301e9c2ff958d64f62f2e4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aoscompose-linux-arm64"
        sha256 "3c3892d7d93009ec8175b2b37f3fcf0a08a37158cb301e9c2ff958d64f62f2e4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aosguard-linux-arm64"
        sha256 "bd8f03949bc3f05f346f08a383a67dfcfb0b0e72e5d4331b6d64babe3210e798"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.583.0/aterm-linux-arm64"
        sha256 "344b15b0507233666b83067950375adc7c7773550fe11f2a2c4950474fe38595"
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
