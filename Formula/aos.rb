class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.590.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aos-darwin-arm64"
    sha256 "29b686b3e986f3cb82dc42022409e8274f6b0bf8350b3d2dd94a5f2b927e8175"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aoscompose-darwin-arm64"
      sha256 "29b686b3e986f3cb82dc42022409e8274f6b0bf8350b3d2dd94a5f2b927e8175"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aosguard-darwin-arm64"
      sha256 "5a471521139a5da0ca1f7208a38ba8feda5d840c7bafde4169e09e61de5f391a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "9438f4184524c4c3c05ca985b488779a6cea066187496e03094e488f5b56a50c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aos-linux-amd64"
      sha256 "c8d33394f0d73fa48d1c3064c2f401232c3dd761f8bd3e9db9af62d0ea2b70eb"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aoscompose-linux-amd64"
        sha256 "c8d33394f0d73fa48d1c3064c2f401232c3dd761f8bd3e9db9af62d0ea2b70eb"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aosguard-linux-amd64"
        sha256 "178d77d1cf69bad847c5a01791e0c38a20c82e8e3de5a49c3a470825f6fbe1b9"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aterm-linux-amd64"
        sha256 "cdf9c8fac79a251114ae880cd0792876f3fb6d118b61a5842e2e749ac9a9b6d0"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aos-linux-arm64"
      sha256 "b24ef22142a8d5290e3261a243a615dfbf49625c60fc06ef85d652b70ac07cef"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aoscompose-linux-arm64"
        sha256 "b24ef22142a8d5290e3261a243a615dfbf49625c60fc06ef85d652b70ac07cef"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aosguard-linux-arm64"
        sha256 "13e1dd0d3238f69a1431478703e24ef58c8807c7f7bc5ffad4b4a78d8324065b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.590.0/aterm-linux-arm64"
        sha256 "1df65cf027f996346b47ae9e592c3d24d57e5c814b13604d7c993cc48aea5464"
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
