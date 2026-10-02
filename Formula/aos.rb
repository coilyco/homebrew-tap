class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.416.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aos-darwin-arm64"
      sha256 "7d29a22843ca8e68951841801378424585eb4427df4d9364f444828f857971b3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aoscompose-darwin-arm64"
        sha256 "7d29a22843ca8e68951841801378424585eb4427df4d9364f444828f857971b3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aosward-darwin-arm64"
        sha256 "7d29a22843ca8e68951841801378424585eb4427df4d9364f444828f857971b3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aosguard-darwin-arm64"
        sha256 "f9ab26c00d30cfd888fb7ab86e63fb91c150c3186c0f0a46508a8a9fa99447a6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aterm-darwin-arm64"
        sha256 "2aa7ed750c9d51c970ac586aacab0760cba4bc9af713a8ac23f7ee99bce0bd97"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aos-linux-amd64"
      sha256 "fd5717608fe0c2c072c4099d4567da1d10281e900ff6c86bc1c237751f4dcd4b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aoscompose-linux-amd64"
        sha256 "fd5717608fe0c2c072c4099d4567da1d10281e900ff6c86bc1c237751f4dcd4b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aosward-linux-amd64"
        sha256 "fd5717608fe0c2c072c4099d4567da1d10281e900ff6c86bc1c237751f4dcd4b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aosguard-linux-amd64"
        sha256 "6d18c94c87904a11498f6867841a2c98c9a551bf8e0bfd10379e246e7093f21b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aterm-linux-amd64"
        sha256 "35055e1da0f2c51c314e95b48b82a179eef64b3df3cf6af6201ffa1ebdd44e3d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aos-linux-arm64"
      sha256 "ad37e76806cab10c854bfa46188f30580fb2a449f2f25ebf5f37c56c2377b804"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aoscompose-linux-arm64"
        sha256 "ad37e76806cab10c854bfa46188f30580fb2a449f2f25ebf5f37c56c2377b804"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aosward-linux-arm64"
        sha256 "ad37e76806cab10c854bfa46188f30580fb2a449f2f25ebf5f37c56c2377b804"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aosguard-linux-arm64"
        sha256 "b2503d594aae633001a0496e524834a3dfb2edeae44565b75702f885f44ede2c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.416.0/aterm-linux-arm64"
        sha256 "1de02452169997d147295ecedf6d4d09ea54ff9df23ef0c7d5ca87e0338f6e0e"
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
