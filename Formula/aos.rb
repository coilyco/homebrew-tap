class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.539.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aos-darwin-arm64"
    sha256 "6d846208e9cf74de372d23b481d7cbfdc3fa84cc4fb7a2608b8e352df8e0f4c9"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aoscompose-darwin-arm64"
      sha256 "6d846208e9cf74de372d23b481d7cbfdc3fa84cc4fb7a2608b8e352df8e0f4c9"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aosguard-darwin-arm64"
      sha256 "b29a849e8de903a918e276bbffd961d4ea03a3e0326c5da6ca13409f142381e5"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "a0b753e93383309be5cbd43963d440f0afc5ffc5da0f342f3e510b9106e5e983"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aos-linux-amd64"
      sha256 "f9e3f86d8267e1a3a868a54b9c3537cabccdf8d6c6dfc10d125b42b9f433fec5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aoscompose-linux-amd64"
        sha256 "f9e3f86d8267e1a3a868a54b9c3537cabccdf8d6c6dfc10d125b42b9f433fec5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aosguard-linux-amd64"
        sha256 "70a90423f0f0e9a52c97731808fca3f708990ebc8ab06fdcbcb4ac14d6cbd5e8"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aterm-linux-amd64"
        sha256 "b0e3dec4ee07c76f4837b968452b8268bd4a092df2aa6720f98aeb13ab6a244e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aos-linux-arm64"
      sha256 "89a9b9f6b4b8c7fc957073a242e237c491c654fb5dc809d32f4e72f2086d5fee"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aoscompose-linux-arm64"
        sha256 "89a9b9f6b4b8c7fc957073a242e237c491c654fb5dc809d32f4e72f2086d5fee"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aosguard-linux-arm64"
        sha256 "1b60569af16017df0e30682d03a8e8b76a3341ca5de5158289e28c3fc5d6e12a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.539.0/aterm-linux-arm64"
        sha256 "e2ab7361b674ed88bb3a4effd67c1e91f907751503c8a233479e1985ea0fe966"
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
