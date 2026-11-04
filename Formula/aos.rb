class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.495.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aos-darwin-arm64"
    sha256 "9596ae7d6e9418712ff0da76691d8c34e2f3751d9397f1e413337d60990e001a"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aoscompose-darwin-arm64"
      sha256 "9596ae7d6e9418712ff0da76691d8c34e2f3751d9397f1e413337d60990e001a"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aosguard-darwin-arm64"
      sha256 "e4e813b056ba9e6b262ca6909d0aa31a78ec38d6241c7d8cec32aa444837771f"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aterm-darwin-arm64"
      sha256 "894367f26ca6bb7e474cc29c996117237482e4e4515c2e1f39f74420ce98dca3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aos-linux-amd64"
      sha256 "e62fd545c816904c4e84064fc171d635b5c3e1df169cc4672d77853840e0f913"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aoscompose-linux-amd64"
        sha256 "e62fd545c816904c4e84064fc171d635b5c3e1df169cc4672d77853840e0f913"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aosguard-linux-amd64"
        sha256 "d9c3c3e43218b6a8a3dc97d0420f823d737935dbee33f19313aa4d6deb7d1a3a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aterm-linux-amd64"
        sha256 "689b4f4b742413bb56d2a1f3f6edc0aa2c22f7105426d548df767bc88f6a811f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aos-linux-arm64"
      sha256 "07b7b6bf29cae2ece8bc4d2a74bfb35ba6cd1c74b556f17ab91011bc76471fc8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aoscompose-linux-arm64"
        sha256 "07b7b6bf29cae2ece8bc4d2a74bfb35ba6cd1c74b556f17ab91011bc76471fc8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aosguard-linux-arm64"
        sha256 "122468cfe5130f22177c51a81d3b410cd076494c761085c2932ec1710b095a7b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.495.0/aterm-linux-arm64"
        sha256 "66da5c117b95351c94d924d5e3e792c65d8fa8d7c1fcf6efe6b4097458347b1d"
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
