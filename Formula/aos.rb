class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.501.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aos-darwin-arm64"
    sha256 "301cf1d4db4557f1ec57914be26dcb3cf5c93fc36d2b5e8d85730dd3c9a64e4e"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aoscompose-darwin-arm64"
      sha256 "301cf1d4db4557f1ec57914be26dcb3cf5c93fc36d2b5e8d85730dd3c9a64e4e"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aosguard-darwin-arm64"
      sha256 "9070902b3236952648c5aa942bd8235ad82837a353a1fd75f41e9b67c7570faa"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aterm-darwin-arm64"
      sha256 "a241ca56b00276ab42952a6d80deedd7eeabcf337ad6808b172b68f051923428"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aos-linux-amd64"
      sha256 "1cb8913ae9494b8b9291e5b6ed6735a25625e86c303245d7dc94842386468a0d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aoscompose-linux-amd64"
        sha256 "1cb8913ae9494b8b9291e5b6ed6735a25625e86c303245d7dc94842386468a0d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aosguard-linux-amd64"
        sha256 "cf9b5815e0283ade5e5cd649178e825b4d9809889ce693de11e6e183a603c7ea"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aterm-linux-amd64"
        sha256 "1c9820b5c0c03cf2169082542cc21f9ad310df9d390e75531f44ba44ec0eafb4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aos-linux-arm64"
      sha256 "a484ebc9a01800b3181955d627c26b4db16f45520f725bc7c8924d9f6b3408ce"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aoscompose-linux-arm64"
        sha256 "a484ebc9a01800b3181955d627c26b4db16f45520f725bc7c8924d9f6b3408ce"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aosguard-linux-arm64"
        sha256 "e1a7c130a320303ebc04f2fc6d41726dfafdad79991773c022ef4c6faf9be73a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.501.0/aterm-linux-arm64"
        sha256 "2373625c871f8d5f1136d7b61c727f15ec6e65c036f935c2e5d7ae48f5f923a5"
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
