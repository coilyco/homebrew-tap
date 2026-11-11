class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.605.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aos-darwin-arm64"
    sha256 "3e47ff72133e86bbf1282e2a787e15fd396f95fa602a56b9134e1f6b1099d662"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aoscompose-darwin-arm64"
      sha256 "3e47ff72133e86bbf1282e2a787e15fd396f95fa602a56b9134e1f6b1099d662"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aosguard-darwin-arm64"
      sha256 "1bfa02d774f6becee840850a6cbbd59f1244a2aa802543a17513010e3592fe66"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "a5e12da67bae00971c52aad51f0651ab2f580dc4eb517105f8194fbc54acb6bc"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aos-linux-amd64"
      sha256 "f2f57f06868a47397d2dd4d672a4d3ffde1b03da429b8ddf52441a6c5cc972c2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aoscompose-linux-amd64"
        sha256 "f2f57f06868a47397d2dd4d672a4d3ffde1b03da429b8ddf52441a6c5cc972c2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aosguard-linux-amd64"
        sha256 "b8d0677c92b27d84419e1748a057b2d0828f535469859c3a2c9f732a3401d4b6"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aterm-linux-amd64"
        sha256 "58eeacfb4d44d835234e568022d83a0a3ee2bfcf59f2a5f774b14a8b373a0a4f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aos-linux-arm64"
      sha256 "6065f0f3ef2cd87893687465fa786f8ce4f167f9fc5a333fb501d482c2991871"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aoscompose-linux-arm64"
        sha256 "6065f0f3ef2cd87893687465fa786f8ce4f167f9fc5a333fb501d482c2991871"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aosguard-linux-arm64"
        sha256 "081f079c417b58f987c80c9c5a9b053ac9817710d3ae973402dd20ccfe38f0ee"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.605.0/aterm-linux-arm64"
        sha256 "6358c5fb72c689a32c318dbb7e4d321dcdd072ea6b2cdaec43658b1b22153aea"
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
