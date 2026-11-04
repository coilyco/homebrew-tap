class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.493.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aos-darwin-arm64"
    sha256 "4b781d80481365e8231e66ea8f1fb5b0f08d8829096b7dee41d0bc2a8622b497"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aoscompose-darwin-arm64"
      sha256 "4b781d80481365e8231e66ea8f1fb5b0f08d8829096b7dee41d0bc2a8622b497"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aosguard-darwin-arm64"
      sha256 "1fe1b46d574e2cf1e8628b83b4c099457fb974cf04020d6d1a9b72b4c7068d8d"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aterm-darwin-arm64"
      sha256 "fe5efc22a38a0c0c4c3ec00aa05e6d2ffb92b62152f84bb9f65d4b938e9b0f02"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aos-linux-amd64"
      sha256 "90a7bd4ef1380f7230fe4d5fcb7a2f127c1b21f93d580f56c808ea39a9be0925"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aoscompose-linux-amd64"
        sha256 "90a7bd4ef1380f7230fe4d5fcb7a2f127c1b21f93d580f56c808ea39a9be0925"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aosguard-linux-amd64"
        sha256 "d182fd7d6ee6206059d674c6239762ea49ea509c55908c752a4f3b21269804a2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aterm-linux-amd64"
        sha256 "753088225c43434a4e17487b3bc8747fbbc03a882ae47085a8bf49a0691e2919"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aos-linux-arm64"
      sha256 "5f8c203a483d971dbff855144e24447f933c90272fed55e6b82bb9f972fb6428"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aoscompose-linux-arm64"
        sha256 "5f8c203a483d971dbff855144e24447f933c90272fed55e6b82bb9f972fb6428"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aosguard-linux-arm64"
        sha256 "291f322a6f82a0eaae2b2d3eb69205c466b4d3a4c9bfa2ca08e2c2d05fda7c61"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.493.0/aterm-linux-arm64"
        sha256 "68c83dadae625e37196694631f2cfbc888df478a28a0973b0f2dffe591be66cc"
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
