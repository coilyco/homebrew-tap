class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.505.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aos-darwin-arm64"
    sha256 "68fd909d045b2d98c689bd694aa884baa7dcc1e70ecd137d56210b3fd2dac84b"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aoscompose-darwin-arm64"
      sha256 "68fd909d045b2d98c689bd694aa884baa7dcc1e70ecd137d56210b3fd2dac84b"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aosguard-darwin-arm64"
      sha256 "bc9c95c07dabee52fba9f37d7cd8869b67af99c7bedf1947a5532b6a8e40f6a1"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aterm-darwin-arm64"
      sha256 "69c2673b4144a249444f72fc94653debd816326c59f973d941421d836569957d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aos-linux-amd64"
      sha256 "b33cd258da7ea545e66a7f0591b62c2503f97adc2dbcf7ff6f7ed08798ab62a8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aoscompose-linux-amd64"
        sha256 "b33cd258da7ea545e66a7f0591b62c2503f97adc2dbcf7ff6f7ed08798ab62a8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aosguard-linux-amd64"
        sha256 "def085b7b3b86ad1e00317ba3117b746fdab66b3b7320788836cb3d105a9d654"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aterm-linux-amd64"
        sha256 "2a79555cb17efa29323a9549d2b12007581fdfd5eee53862a138a3c73bf75492"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aos-linux-arm64"
      sha256 "c47e96bd5273fe47eea83620e64befafa66f8881d9ac111e5d44fabe25305969"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aoscompose-linux-arm64"
        sha256 "c47e96bd5273fe47eea83620e64befafa66f8881d9ac111e5d44fabe25305969"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aosguard-linux-arm64"
        sha256 "256a777e13de1def14515a0da4e7b24e1b7b88537c3a6459900d50308415e958"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.505.0/aterm-linux-arm64"
        sha256 "77c1ac395c5e3ac8d381909203c7e9d976364be3d4484c46357f79841f23824e"
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
