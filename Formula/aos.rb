class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.465.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aos-darwin-arm64"
      sha256 "811981f47958374c5902c69638d8f3e0d6ec7855c6b718d032cbb1d0c1e8b0ae"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aoscompose-darwin-arm64"
        sha256 "811981f47958374c5902c69638d8f3e0d6ec7855c6b718d032cbb1d0c1e8b0ae"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aosward-darwin-arm64"
        sha256 "811981f47958374c5902c69638d8f3e0d6ec7855c6b718d032cbb1d0c1e8b0ae"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aosguard-darwin-arm64"
        sha256 "aa58eaec8218ae845dfbb21e75358cc70859d0b2fafddfa021488ea89210fbd1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aterm-darwin-arm64"
        sha256 "6966db297ad4db52c5f85e3144fc1b5c73547d12b39cd33f5ede9931ee58fe13"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aos-linux-amd64"
      sha256 "be0ddf198737685f362803f8abd1b5f1b7343bd857e6fd5865d7fc37a7f92056"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aoscompose-linux-amd64"
        sha256 "be0ddf198737685f362803f8abd1b5f1b7343bd857e6fd5865d7fc37a7f92056"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aosward-linux-amd64"
        sha256 "be0ddf198737685f362803f8abd1b5f1b7343bd857e6fd5865d7fc37a7f92056"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aosguard-linux-amd64"
        sha256 "166605f3e59a52dcd1c67df81008ef250041f9671b0ead1eb9adee3048316394"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aterm-linux-amd64"
        sha256 "6e3a4cdf1a58827ec0fb91b7ae575c46f1c3e64b1e4280c02f095e4017c71ff2"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aos-linux-arm64"
      sha256 "1c4c6484c0d10b4fff52e5f2ccb673601932ea82d1602be08c1b08056055341e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aoscompose-linux-arm64"
        sha256 "1c4c6484c0d10b4fff52e5f2ccb673601932ea82d1602be08c1b08056055341e"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aosward-linux-arm64"
        sha256 "1c4c6484c0d10b4fff52e5f2ccb673601932ea82d1602be08c1b08056055341e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aosguard-linux-arm64"
        sha256 "5622da2bc6cff2c70af1c0813363bdffe085ba637b4b16a2ec8ebe5ba4773136"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.465.0/aterm-linux-arm64"
        sha256 "63837d9a2760d6acafcc5c6bd6bf724710f070027f85ad75dcb646b186833ef2"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
