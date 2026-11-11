class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.576.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aos-darwin-arm64"
    sha256 "77cdcab9b84eb798693c0c79723b87b5ac59eebdca0db39ec21c54fd73d3f75f"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aoscompose-darwin-arm64"
      sha256 "77cdcab9b84eb798693c0c79723b87b5ac59eebdca0db39ec21c54fd73d3f75f"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aosguard-darwin-arm64"
      sha256 "19ae108971c7764118337c8db69d216cfaad8df61878b2dfa1eae04b88859fea"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "bd7517c48f159cead26212e96347816110ed84b3f217251105a704f9c11e35fe"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aos-linux-amd64"
      sha256 "179dd3ea06c7f868131fa78aba04670f17b9b8c083609049e75f27d2a964eb77"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aoscompose-linux-amd64"
        sha256 "179dd3ea06c7f868131fa78aba04670f17b9b8c083609049e75f27d2a964eb77"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aosguard-linux-amd64"
        sha256 "dacc5fd6e3eb7c3a3ee790184fe2a1c7503d38aef61f8e4fecf2524823ee127c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aterm-linux-amd64"
        sha256 "6a6cf400448574213904dac21a6b2675203635d3264eec4ca6506e091a014532"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aos-linux-arm64"
      sha256 "2b5c8d380631fc1207be6c8064e800ef9d0c5c5c6fe29c9eb0740ebdd98a8178"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aoscompose-linux-arm64"
        sha256 "2b5c8d380631fc1207be6c8064e800ef9d0c5c5c6fe29c9eb0740ebdd98a8178"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aosguard-linux-arm64"
        sha256 "e0200a9f7b55aa2be87d7820eb8914da61fa97dba75d5553e629bc6f50cedaf3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.576.0/aterm-linux-arm64"
        sha256 "277f4ce5e78e427df21c1395132a943feebb9b568eec977f3e3fa8c7f08a0932"
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
