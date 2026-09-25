class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.371.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aos-darwin-arm64"
      sha256 "110ee46c3583ab34a04bee144296ee52656da907687dca1aef6e705a8ef7b221"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aoscompose-darwin-arm64"
        sha256 "110ee46c3583ab34a04bee144296ee52656da907687dca1aef6e705a8ef7b221"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aosward-darwin-arm64"
        sha256 "110ee46c3583ab34a04bee144296ee52656da907687dca1aef6e705a8ef7b221"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aosguard-darwin-arm64"
        sha256 "8a9d2d2565ab2404bdf332d1a7f46a48cbac31721b3d25cfd34a8768153bb30a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aterm-darwin-arm64"
        sha256 "793d1cebc7d629347fea1ad3f1c2398d01e4fdeaaad478e361dc2b7030798890"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aos-linux-amd64"
      sha256 "b941f1d37ebed48fa9a24729e9eb87972896e6f04b612b1408183af0098cad1b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aoscompose-linux-amd64"
        sha256 "b941f1d37ebed48fa9a24729e9eb87972896e6f04b612b1408183af0098cad1b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aosward-linux-amd64"
        sha256 "b941f1d37ebed48fa9a24729e9eb87972896e6f04b612b1408183af0098cad1b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aosguard-linux-amd64"
        sha256 "987a9717dd73c78e9ea8d89997256cd88cc10606c8726f769a59147f3bcc5db7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aterm-linux-amd64"
        sha256 "058e664e8204acd8338f081905b617d75c453ee241cec26e8925c13b43445242"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aos-linux-arm64"
      sha256 "9ca897ca96707862eb62a98761dcece3af4a367f378f8781d422713875253a58"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aoscompose-linux-arm64"
        sha256 "9ca897ca96707862eb62a98761dcece3af4a367f378f8781d422713875253a58"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aosward-linux-arm64"
        sha256 "9ca897ca96707862eb62a98761dcece3af4a367f378f8781d422713875253a58"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aosguard-linux-arm64"
        sha256 "5489780770336d875fce14eb07fd7fad5f73a0b9bf2cf4581462a7410103ab78"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.371.0/aterm-linux-arm64"
        sha256 "d457488b7b3f09d50f30cb99f90a9593aea96df316c46e8faaf80e12a7e9188a"
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
