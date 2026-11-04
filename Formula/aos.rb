class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.498.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aos-darwin-arm64"
    sha256 "2c67c9c83758ee0b05d6a84d22acb4b3dcd75fecdd0c016508d43dc8281180c1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aoscompose-darwin-arm64"
      sha256 "2c67c9c83758ee0b05d6a84d22acb4b3dcd75fecdd0c016508d43dc8281180c1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aosguard-darwin-arm64"
      sha256 "40deb4b4b4beeb2c701c7b502c37c983979e4d3bcb171bf26ddcb756c65a4959"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aterm-darwin-arm64"
      sha256 "19cb5c1c894410ff749382407b48371289db5b4be545da6e17df0c99a803508e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aos-linux-amd64"
      sha256 "c36519c85679a27ba5b1c08c319944ec8d89e0a6fa7ec5f6a36b4d6e69abb465"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aoscompose-linux-amd64"
        sha256 "c36519c85679a27ba5b1c08c319944ec8d89e0a6fa7ec5f6a36b4d6e69abb465"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aosguard-linux-amd64"
        sha256 "c984fdb52e12df263afc29df551e3cf49ca9dfe206fab25bee4f08f43d88a17f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aterm-linux-amd64"
        sha256 "3819089a43ccdb6871c226cc315606373c6225f19de136defc78ca2edee2aaee"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aos-linux-arm64"
      sha256 "c40cf2de875230701f6cd35c81489fbdb54a19d73679dcb62113ac96357c2fa1"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aoscompose-linux-arm64"
        sha256 "c40cf2de875230701f6cd35c81489fbdb54a19d73679dcb62113ac96357c2fa1"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aosguard-linux-arm64"
        sha256 "94848f2dc290c14bce0a3f3f5c2a2930565da2f65c3cadd29f315acd5aacc67a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.498.0/aterm-linux-arm64"
        sha256 "ff2a8d8a472e11acde6f9c53e11ef2bf83aec298b6bfda10a7a7238b6f0e017d"
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
