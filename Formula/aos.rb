class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.508.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aos-darwin-arm64"
    sha256 "422cb706561e60274ad359541e6341eace971af224a338cf7cb4ef5dc023a5ac"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aoscompose-darwin-arm64"
      sha256 "422cb706561e60274ad359541e6341eace971af224a338cf7cb4ef5dc023a5ac"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aosguard-darwin-arm64"
      sha256 "797aabb23437cb68546dc19022856c05dfcc6e0c41d348e52aa82b7f628e8f70"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aterm-darwin-arm64"
      sha256 "800ab6a3a855edca85d3d5a0e701affdf03632feb1f93615debdb612aada84c1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aos-linux-amd64"
      sha256 "762ba2c36362e721f773da95df87e60447c0724d50c22382dcd5d46b2c99cdc4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aoscompose-linux-amd64"
        sha256 "762ba2c36362e721f773da95df87e60447c0724d50c22382dcd5d46b2c99cdc4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aosguard-linux-amd64"
        sha256 "388ab7a57aa65715ca303c2c6d628cd0bce893a4ddbdb3f99b8dba38a8fdcdc1"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aterm-linux-amd64"
        sha256 "427f5ffa82be329200aad52d58bda200dbda64f9c1ffb0481dabeaa38a3904a0"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aos-linux-arm64"
      sha256 "f5cd78242d438e2a96e6f6c667d5154a976f40cfdf8589f6d062895fc6182bef"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aoscompose-linux-arm64"
        sha256 "f5cd78242d438e2a96e6f6c667d5154a976f40cfdf8589f6d062895fc6182bef"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aosguard-linux-arm64"
        sha256 "471161b5934f28546bbff4e3517e82afd559c30ce9641b836c33147c82c6678c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.508.0/aterm-linux-arm64"
        sha256 "d8262885130fb578c7bbc8992e0bd0568103f3a4dfbbf35e175a0914fee84a9f"
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
