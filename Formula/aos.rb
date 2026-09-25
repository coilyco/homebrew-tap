class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.380.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aos-darwin-arm64"
      sha256 "520e4e00a8a04690dfea38e0e3b73c8241f4684a39c64e2b2cda17df4901081e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aoscompose-darwin-arm64"
        sha256 "520e4e00a8a04690dfea38e0e3b73c8241f4684a39c64e2b2cda17df4901081e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aosward-darwin-arm64"
        sha256 "520e4e00a8a04690dfea38e0e3b73c8241f4684a39c64e2b2cda17df4901081e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aosguard-darwin-arm64"
        sha256 "eec3e69c291a2d13cc11d60780ac0f3889bc39cf5d794d6fda05cde04e72da87"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aterm-darwin-arm64"
        sha256 "b08c4bb066725bb554a552f928fde02b527bb2e8462dd76a6e54fcb2e6410308"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aos-linux-amd64"
      sha256 "a9d51397bcde02b82c4293d7f43d5e35d185e12e671e06f39172f171680d1959"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aoscompose-linux-amd64"
        sha256 "a9d51397bcde02b82c4293d7f43d5e35d185e12e671e06f39172f171680d1959"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aosward-linux-amd64"
        sha256 "a9d51397bcde02b82c4293d7f43d5e35d185e12e671e06f39172f171680d1959"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aosguard-linux-amd64"
        sha256 "c65da795826445bd356d82a5046497781fe11f1462dfd2ddeb8bd59218d63d43"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aterm-linux-amd64"
        sha256 "98e478562b11dd37d70901095d478689cec889552f10c5ab6534d47333b26b00"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aos-linux-arm64"
      sha256 "8c4ead9e84cc2ac2433e3de07ec75aee7dd7d701bd7c11297c651e1b106e4608"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aoscompose-linux-arm64"
        sha256 "8c4ead9e84cc2ac2433e3de07ec75aee7dd7d701bd7c11297c651e1b106e4608"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aosward-linux-arm64"
        sha256 "8c4ead9e84cc2ac2433e3de07ec75aee7dd7d701bd7c11297c651e1b106e4608"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aosguard-linux-arm64"
        sha256 "b9ff3eea4ad3f4a19b443a33e7baa0e337e7880c988606bf20a422a775cab619"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.380.0/aterm-linux-arm64"
        sha256 "5eef26e59061fd8c1e981926c3e2be60d962b9876b8a9ae1f3ef75a8f108ca5a"
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
