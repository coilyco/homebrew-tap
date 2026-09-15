class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.337.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aos-darwin-arm64"
      sha256 "0e658f7d08752b665855c3ce0ed4695e7e8ddcc81df107b5801ac90d5e09e78c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aoscompose-darwin-arm64"
        sha256 "0e658f7d08752b665855c3ce0ed4695e7e8ddcc81df107b5801ac90d5e09e78c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aosward-darwin-arm64"
        sha256 "0e658f7d08752b665855c3ce0ed4695e7e8ddcc81df107b5801ac90d5e09e78c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aosguard-darwin-arm64"
        sha256 "89c066b968be65070d8e1506dc66da9e20a609c88ff41f73c185353754eba897"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aterm-darwin-arm64"
        sha256 "29fe95e1e21c2c52d69e33723965e437365ec64dfa9402ebbd8bd0b35b8a861b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aos-linux-amd64"
      sha256 "d3d263e956628329339053989b4a9c64213714bdcd918f5cc889034e72c6c60e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aoscompose-linux-amd64"
        sha256 "d3d263e956628329339053989b4a9c64213714bdcd918f5cc889034e72c6c60e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aosward-linux-amd64"
        sha256 "d3d263e956628329339053989b4a9c64213714bdcd918f5cc889034e72c6c60e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aosguard-linux-amd64"
        sha256 "de3f741698587abf4a78c46ed9c3d176e1bcde3be3faaf72244345760c1aadbc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aterm-linux-amd64"
        sha256 "480dd44ed5f73d74bbaaca15c3b24a4aa27347a0417c731a22b6dc4499505773"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aos-linux-arm64"
      sha256 "b0b676e075e20f4efc3cd9d41b33977067d865ff95cd478e8bb60fdac2d04be5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aoscompose-linux-arm64"
        sha256 "b0b676e075e20f4efc3cd9d41b33977067d865ff95cd478e8bb60fdac2d04be5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aosward-linux-arm64"
        sha256 "b0b676e075e20f4efc3cd9d41b33977067d865ff95cd478e8bb60fdac2d04be5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aosguard-linux-arm64"
        sha256 "54a551b22a2a5df5d56633f555d17d797b927b5f1df05bf503a292100051069e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.337.0/aterm-linux-arm64"
        sha256 "a2f8c276bb272ed28b78968522d1a7c2c873e2bcf3ec7493dcae911b6f997b3c"
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
