class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.615.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aos-darwin-arm64"
    sha256 "8eec78a3b3708db4b0829df86b83576fff3da0f7a3975b28c08377b077b5d4ae"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aoscompose-darwin-arm64"
      sha256 "8eec78a3b3708db4b0829df86b83576fff3da0f7a3975b28c08377b077b5d4ae"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aosguard-darwin-arm64"
      sha256 "562ee4120c51fd1e1e83ee500271fb74d05061eef4bc55889a69300da9b1a3a9"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "bab50e379de86c35a966e063bb425b2616c69312d23b475485bb0dea2e53ed5f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aos-linux-amd64"
      sha256 "f0d3c7c62d2701f3d7600562dbb7aae62e84ed3caa26e96c4135124551c20af9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aoscompose-linux-amd64"
        sha256 "f0d3c7c62d2701f3d7600562dbb7aae62e84ed3caa26e96c4135124551c20af9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aosguard-linux-amd64"
        sha256 "94f3207b7262aa14c7402a0fefc6a37538b5cdd08369f378f930642c08eabaaa"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aterm-linux-amd64"
        sha256 "ac459f61ac0d0668fae31b2375be3e7d157085cb9e632788d68693b053a7121f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aos-linux-arm64"
      sha256 "713338d8a9b16488ba04a38f163402577b634c2f510f3c3a2f29150f787e68ab"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aoscompose-linux-arm64"
        sha256 "713338d8a9b16488ba04a38f163402577b634c2f510f3c3a2f29150f787e68ab"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aosguard-linux-arm64"
        sha256 "0ab7ca45cff02b9f2de2b1f6c265d7face5ed96b3486739ab822ce69e3499ce0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.615.0/aterm-linux-arm64"
        sha256 "5408617c4751f56fae792358a0f9a0a88d29d02acb74debdabeaabf3b5db8c84"
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
