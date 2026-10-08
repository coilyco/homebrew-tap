class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.446.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aos-darwin-arm64"
      sha256 "e785032f2156135a66f3befe296a41e85e308b818d4f231ceaf814268291b9f0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aoscompose-darwin-arm64"
        sha256 "e785032f2156135a66f3befe296a41e85e308b818d4f231ceaf814268291b9f0"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aosward-darwin-arm64"
        sha256 "e785032f2156135a66f3befe296a41e85e308b818d4f231ceaf814268291b9f0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aosguard-darwin-arm64"
        sha256 "9c6f3fc61112146b5f8093662905ff2762bca913456212c5ce6112f1a7851937"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aterm-darwin-arm64"
        sha256 "4fa3c797cfb4bb4411b36bafadea7b8f1e6799cc8088a0394546264817427891"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aos-linux-amd64"
      sha256 "3bb2827ffd52f088992f15ed832bfa53536b436ebb6b58c64ad835a97f9ce676"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aoscompose-linux-amd64"
        sha256 "3bb2827ffd52f088992f15ed832bfa53536b436ebb6b58c64ad835a97f9ce676"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aosward-linux-amd64"
        sha256 "3bb2827ffd52f088992f15ed832bfa53536b436ebb6b58c64ad835a97f9ce676"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aosguard-linux-amd64"
        sha256 "b8e49d9a15c5c0c0b6ffa0f5b6a5cf731f43cbebf242376ac968c556e102ba18"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aterm-linux-amd64"
        sha256 "a0c4f7be00388b1cd500dfdbb446cecfd00e197ce3ae2fac08ed4481687759e0"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aos-linux-arm64"
      sha256 "b7583c4b1680a0029da4729a00a1b566c1ef62bcc3e86cf542187cf82407ba1c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aoscompose-linux-arm64"
        sha256 "b7583c4b1680a0029da4729a00a1b566c1ef62bcc3e86cf542187cf82407ba1c"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aosward-linux-arm64"
        sha256 "b7583c4b1680a0029da4729a00a1b566c1ef62bcc3e86cf542187cf82407ba1c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aosguard-linux-arm64"
        sha256 "63cade2a968e5e3e382de1224655a9b79e7ba480ffb5f58eeaa98f0610a2556b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.446.0/aterm-linux-arm64"
        sha256 "db57e1771384744625d9a29ff7c3a15b1fad4b46000cc46edc79ba3992c57bbd"
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
