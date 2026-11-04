class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.497.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aos-darwin-arm64"
    sha256 "06e0eb001dc9b3b5eaa7bc67b45ab7e3194335f0e4ec9ad7614472142a2116a3"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aoscompose-darwin-arm64"
      sha256 "06e0eb001dc9b3b5eaa7bc67b45ab7e3194335f0e4ec9ad7614472142a2116a3"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aosguard-darwin-arm64"
      sha256 "e848c5d3c91c1cb77499fafff966a14529665ca72e227c360f6c4124ce69dcd4"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aterm-darwin-arm64"
      sha256 "693ec62cbdfec67060d5ec656fa59960786a487a71caf5478dfee35ac6b92e90"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aos-linux-amd64"
      sha256 "71253e3f97bfc1d2a5eaf44fb31bc05580af7ce028ecc484c6d03f668ad17a28"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aoscompose-linux-amd64"
        sha256 "71253e3f97bfc1d2a5eaf44fb31bc05580af7ce028ecc484c6d03f668ad17a28"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aosguard-linux-amd64"
        sha256 "af961b3f9781cdb4705898d0ab92b09ee220f0623bf9b1f9d7403fb0aa644f60"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aterm-linux-amd64"
        sha256 "bf3002476f22d36968b0b7841352f912590ef2afa0c73a3b2edcb8ef3517174e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aos-linux-arm64"
      sha256 "62fd3eb3ba20f098493de25e3d533c5cb9fb54ce9e6f030091a04b5d4ec1a86d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aoscompose-linux-arm64"
        sha256 "62fd3eb3ba20f098493de25e3d533c5cb9fb54ce9e6f030091a04b5d4ec1a86d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aosguard-linux-arm64"
        sha256 "41b5296613b337424616de20ea57c87faa6769c49a385be148a11842c6b2c10c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.497.0/aterm-linux-arm64"
        sha256 "128ef157952f99a4faf6406da30465f334a98ad87aafbb773af18a4b6fa79714"
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
