class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.633.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aos-darwin-arm64"
    sha256 "69e3a7e160f23fc7b95881792c8e245aaa7a2c22c9750847492ebcb92dd87b2b"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aoscompose-darwin-arm64"
      sha256 "69e3a7e160f23fc7b95881792c8e245aaa7a2c22c9750847492ebcb92dd87b2b"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aosguard-darwin-arm64"
      sha256 "ed2e386ec8422c4a905912f6b63dc52c0f80304ef72d7cc009e9c79de7ddbf7e"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "ee2737928edb05ccb243bdca1cf5a87cb05ab6f15b5c34508ee87cb76b37cf6c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aos-linux-amd64"
      sha256 "a40e2a4659643301ee6c9ae83419845198290dfdb561bbf6f4259b55bad57c95"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aoscompose-linux-amd64"
        sha256 "a40e2a4659643301ee6c9ae83419845198290dfdb561bbf6f4259b55bad57c95"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aosguard-linux-amd64"
        sha256 "f0566822bc02aecb9f93b7ab4985b413b53cddb3fa107ec094e530a4cb60fc9d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aterm-linux-amd64"
        sha256 "9c623ba12dd36860107aa2c1b38009422d12aa549c59a161e706718f28b69938"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aos-linux-arm64"
      sha256 "90bc4c4e2e46abde55b02c635f96e0617521d05f13748254ef16052266158932"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aoscompose-linux-arm64"
        sha256 "90bc4c4e2e46abde55b02c635f96e0617521d05f13748254ef16052266158932"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aosguard-linux-arm64"
        sha256 "745eb169b1143c2d9cfd96d2b2890e8929c97a912973eae572db878df7030cb7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.633.0/aterm-linux-arm64"
        sha256 "84ee07601ee967bbeba32956092d0725b6edd098bb10748f420cea105ed5eead"
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
