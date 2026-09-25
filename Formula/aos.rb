class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.376.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aos-darwin-arm64"
      sha256 "8101b21edce3e500289fc415c7cefda2010eefb825b91e32cc075c0002e072a3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aoscompose-darwin-arm64"
        sha256 "8101b21edce3e500289fc415c7cefda2010eefb825b91e32cc075c0002e072a3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aosward-darwin-arm64"
        sha256 "8101b21edce3e500289fc415c7cefda2010eefb825b91e32cc075c0002e072a3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aosguard-darwin-arm64"
        sha256 "722972f49d49147b31dd99543d0a0738c9a8f2b80af8d3464dcba7b068e95352"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aterm-darwin-arm64"
        sha256 "9e465fcf4dda4e85d8f7ef1b6c41d9bd25d6a6267bc90746bc0aef1501299f61"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aos-linux-amd64"
      sha256 "3bc469a98827ab9c82da8e0420ec66b38319ef76c82339b2cdf1bfbd3c4dfdb4"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aoscompose-linux-amd64"
        sha256 "3bc469a98827ab9c82da8e0420ec66b38319ef76c82339b2cdf1bfbd3c4dfdb4"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aosward-linux-amd64"
        sha256 "3bc469a98827ab9c82da8e0420ec66b38319ef76c82339b2cdf1bfbd3c4dfdb4"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aosguard-linux-amd64"
        sha256 "38c6506ef0d5a19e0aa69db310431d9f9b4dd54a60bee57da598be001f1756b4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aterm-linux-amd64"
        sha256 "9ad1e3c0c949bf0cd27a3bf7853d0c28fa1d3c0de98a4582bf6dca13b37e8ec1"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aos-linux-arm64"
      sha256 "8a763bfd184d1edba0d6ea7e149a9873eed87e4c3cc6d1f76c4a09e7f2d5125c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aoscompose-linux-arm64"
        sha256 "8a763bfd184d1edba0d6ea7e149a9873eed87e4c3cc6d1f76c4a09e7f2d5125c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aosward-linux-arm64"
        sha256 "8a763bfd184d1edba0d6ea7e149a9873eed87e4c3cc6d1f76c4a09e7f2d5125c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aosguard-linux-arm64"
        sha256 "1307d9175138e531ef363857e399b0a61c1ca9f3452819e38d757f796979d481"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.376.0/aterm-linux-arm64"
        sha256 "38998ff7a33ba8c73c1a9947453e925b18c188e37fd05bd037b13410787eccf0"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
