class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.361.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aos-darwin-arm64"
      sha256 "1621c2771d7ecc0b512b9bd160ac98cd2df2256d8251df851f2afa7aabcef71b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aoscompose-darwin-arm64"
        sha256 "1621c2771d7ecc0b512b9bd160ac98cd2df2256d8251df851f2afa7aabcef71b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aosward-darwin-arm64"
        sha256 "1621c2771d7ecc0b512b9bd160ac98cd2df2256d8251df851f2afa7aabcef71b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aosguard-darwin-arm64"
        sha256 "21641443851e1078e3e29270081ba2f912c0647daea767e7ce9ffbfc1c092ace"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aterm-darwin-arm64"
        sha256 "c6b2d26aaa8d06107ae6a427a7934d63814d11deff01ee7129f2379e6fd01b17"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aos-linux-amd64"
      sha256 "68cd036db86fda777824724c222d0a1d9f6a0adc5a3d73bae28a27f4437f6e89"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aoscompose-linux-amd64"
        sha256 "68cd036db86fda777824724c222d0a1d9f6a0adc5a3d73bae28a27f4437f6e89"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aosward-linux-amd64"
        sha256 "68cd036db86fda777824724c222d0a1d9f6a0adc5a3d73bae28a27f4437f6e89"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aosguard-linux-amd64"
        sha256 "965da52ee1f234c9d7f4bf4f63c76fd8f573fdb2dbccf55680e891bc1dbe5c20"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aterm-linux-amd64"
        sha256 "69e2f2f30289015b9f0d6356ea36111177fa3f1f9ded58fde9500588d2978bf4"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aos-linux-arm64"
      sha256 "c99ef643ccff8d77d4d99e3bb15e2839caf0c5aba64984464d2f0ee176a21df5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aoscompose-linux-arm64"
        sha256 "c99ef643ccff8d77d4d99e3bb15e2839caf0c5aba64984464d2f0ee176a21df5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aosward-linux-arm64"
        sha256 "c99ef643ccff8d77d4d99e3bb15e2839caf0c5aba64984464d2f0ee176a21df5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aosguard-linux-arm64"
        sha256 "dcd6cfd7732f170f9a9896325e43d03697c9236dfae411b1d08f199728e9974b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.361.0/aterm-linux-arm64"
        sha256 "7fe0b7d163f1a4117f86d924bc19894d2782ae24271bfea59238c08d5cc70422"
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
