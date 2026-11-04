class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.511.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aos-darwin-arm64"
    sha256 "174f196213e55e0a2d89880e848d50aee8f8d5507f085fe06794b96710a10bc5"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aoscompose-darwin-arm64"
      sha256 "174f196213e55e0a2d89880e848d50aee8f8d5507f085fe06794b96710a10bc5"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aosguard-darwin-arm64"
      sha256 "abbd6d6611a66e96db846ff299e5632d7c5f3273042e7bf18c758a4fc275cf49"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aterm-darwin-arm64"
      sha256 "e9f86ab49f0e896df568e12cbd2a77e63b8d3f001e4dfaad63348ada7850fa63"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aos-linux-amd64"
      sha256 "069abaff0bb2d5f4754ebe9c36dff9da44830f5b6cfcd5fe8cd6730c33411f08"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aoscompose-linux-amd64"
        sha256 "069abaff0bb2d5f4754ebe9c36dff9da44830f5b6cfcd5fe8cd6730c33411f08"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aosguard-linux-amd64"
        sha256 "cb21712ec3e9df6b8f02096719456c319561f54dabaada1d8d252e505fbd78bb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aterm-linux-amd64"
        sha256 "de9ae431d4d1e188d4f1c13d068a3cceea63723c3381e41cb2f4b3697461e88b"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aos-linux-arm64"
      sha256 "dca1cd39f521b2eacaa344f9f777313ce26c34723f56db4f1e80bf90b2f8435f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aoscompose-linux-arm64"
        sha256 "dca1cd39f521b2eacaa344f9f777313ce26c34723f56db4f1e80bf90b2f8435f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aosguard-linux-arm64"
        sha256 "9b540f4e831d87cb581d78339362a302816b7923d4dd6a5cdd1e80d8b31178c6"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.511.0/aterm-linux-arm64"
        sha256 "88f04134bf9112a684af1db00778b73f85254ffdec6da3fb14a45ce375baa6ee"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
