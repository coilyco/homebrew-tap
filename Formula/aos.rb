class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.540.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aos-darwin-arm64"
    sha256 "8fc8c980a6f6fee8416625c9408421f1e6f03cf97b3f6d60a236c8092e80be4f"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aoscompose-darwin-arm64"
      sha256 "8fc8c980a6f6fee8416625c9408421f1e6f03cf97b3f6d60a236c8092e80be4f"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aosguard-darwin-arm64"
      sha256 "aaca1a5f46ceac80542bb253a920e4dc0308a6b6970bf9c8fe17cda9e08c74e9"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "8c58caae72eac6ddb8f3756dd8a5dba85b34f18261281e7d9d7e51de860c1fc5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aos-linux-amd64"
      sha256 "09915e10a47684dbc25b479344a44585b7615d90256eed67e52a00cc830a50bf"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aoscompose-linux-amd64"
        sha256 "09915e10a47684dbc25b479344a44585b7615d90256eed67e52a00cc830a50bf"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aosguard-linux-amd64"
        sha256 "4608d9834148e5472238092849e6f7919d1a158d4afabff2f2f31bb0c5617770"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aterm-linux-amd64"
        sha256 "7724686f2fa9d601eb057fc8dcdb4ec49a256a294a8c3c28e4ae87aba6f0f002"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aos-linux-arm64"
      sha256 "0612f1445ec771c8fe932eb96b542cbfe3220ae1785886af39246b008e304adb"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aoscompose-linux-arm64"
        sha256 "0612f1445ec771c8fe932eb96b542cbfe3220ae1785886af39246b008e304adb"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aosguard-linux-arm64"
        sha256 "884a491231e25dd6ace5477f99c9490047f489a318da21da9ef1fee7b57acd15"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.540.0/aterm-linux-arm64"
        sha256 "951de5374ed9b97358606f0b38e05ef11e002ec003ed2f242a98445d50f93cf2"
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
