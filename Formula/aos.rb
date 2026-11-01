class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.487.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aos-darwin-arm64"
    sha256 "919a92f5bc994db806316a412e5911fedf3aefec11765d6afd9b21a4822225e2"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aoscompose-darwin-arm64"
      sha256 "919a92f5bc994db806316a412e5911fedf3aefec11765d6afd9b21a4822225e2"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aosguard-darwin-arm64"
      sha256 "c2461dca008c383c62f2eac8b04d7a9871ff280eb6445169764826c365235746"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aterm-darwin-arm64"
      sha256 "581888fe2b7abae00a7ca09c1c1dc1b3ca8f0c283d94393e09cdddebf106aedf"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aos-linux-amd64"
      sha256 "511985e3321b1f325b003f55c7d2ee3b6bbe8ee14f8f288273421b88f585e83a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aoscompose-linux-amd64"
        sha256 "511985e3321b1f325b003f55c7d2ee3b6bbe8ee14f8f288273421b88f585e83a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aosguard-linux-amd64"
        sha256 "827cb1364ab6769d6cb2c640d145f063892579ee64bca1cfd694a9bd31789bbd"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aterm-linux-amd64"
        sha256 "a85653374166fa3ebe0698213201d17d4e3d0a6434f9797e9fc8fd45f196a01d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aos-linux-arm64"
      sha256 "d1d104e2a4b59ca7d01aa86ab0fc8b58c96de7529f42ab92cbd8af1ca858831a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aoscompose-linux-arm64"
        sha256 "d1d104e2a4b59ca7d01aa86ab0fc8b58c96de7529f42ab92cbd8af1ca858831a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aosguard-linux-arm64"
        sha256 "e1efd6d8598de08fcf85eb4e5ef2cdda119fdaa71ed5e97be0de4023e1ea2306"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.487.0/aterm-linux-arm64"
        sha256 "bd96f629fb1bc2513a345fb9bf2465d21c314efae5017dac30b33389b914bc94"
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
