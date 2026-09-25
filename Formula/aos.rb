class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.391.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aos-darwin-arm64"
      sha256 "3e3bef74df3851d1c05a2365d68d44796d1d6447d470832d6a082d2aedde4bfb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aoscompose-darwin-arm64"
        sha256 "3e3bef74df3851d1c05a2365d68d44796d1d6447d470832d6a082d2aedde4bfb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aosward-darwin-arm64"
        sha256 "3e3bef74df3851d1c05a2365d68d44796d1d6447d470832d6a082d2aedde4bfb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aosguard-darwin-arm64"
        sha256 "440b5f71d452a615db9d1814c0d891eecdc25dbee61b86f468fb09fb6a34f3e3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aterm-darwin-arm64"
        sha256 "a65890ffae77b23d56f2358505167aaffb3684b72b768c77d6d0e234362197ef"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aos-linux-amd64"
      sha256 "43b4a1b6ead7951e3edc1ac91c62dc6687e94605a33ff09778ced00cb876d504"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aoscompose-linux-amd64"
        sha256 "43b4a1b6ead7951e3edc1ac91c62dc6687e94605a33ff09778ced00cb876d504"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aosward-linux-amd64"
        sha256 "43b4a1b6ead7951e3edc1ac91c62dc6687e94605a33ff09778ced00cb876d504"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aosguard-linux-amd64"
        sha256 "7c950dd3977fe6caa0e2a451a9bb92e33a66ed059e886416134210518ff36478"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aterm-linux-amd64"
        sha256 "a3504e2285a45f581840b8c06fc0e723c4f77c5c517e9eb2c8d1cc452011865c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aos-linux-arm64"
      sha256 "5674f98c1ba1ca4408d93c20b7f91010112a26b07038e69cce45d086dbe5608c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aoscompose-linux-arm64"
        sha256 "5674f98c1ba1ca4408d93c20b7f91010112a26b07038e69cce45d086dbe5608c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aosward-linux-arm64"
        sha256 "5674f98c1ba1ca4408d93c20b7f91010112a26b07038e69cce45d086dbe5608c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aosguard-linux-arm64"
        sha256 "031315b6817afbcf2b12e5a7ed724b75154496e8816ebc5e207b0d6e47329205"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.391.0/aterm-linux-arm64"
        sha256 "808b4ffd33b1839d5ec39ffd76ce00b44d479c805f0c105afe196b1001747835"
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
