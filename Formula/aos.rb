class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.406.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aos-darwin-arm64"
      sha256 "faa6ca73f8460de164c3723b8bc8bf9e2f34a7d357e3182cd19af09090db444d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aoscompose-darwin-arm64"
        sha256 "faa6ca73f8460de164c3723b8bc8bf9e2f34a7d357e3182cd19af09090db444d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aosward-darwin-arm64"
        sha256 "faa6ca73f8460de164c3723b8bc8bf9e2f34a7d357e3182cd19af09090db444d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aosguard-darwin-arm64"
        sha256 "3d9ac2acc0172f643f81f6a454de3139805fe99543cb09033cb4694457077db0"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aterm-darwin-arm64"
        sha256 "9fe214acc29331549a2cc0ccc7fd86c915ba191a97e8cd821589b87e4e71edee"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aos-linux-amd64"
      sha256 "daef53e07b06c97ef7e563cfb8bd9fbccc4626cb2bb375f86dc428d37f174add"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aoscompose-linux-amd64"
        sha256 "daef53e07b06c97ef7e563cfb8bd9fbccc4626cb2bb375f86dc428d37f174add"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aosward-linux-amd64"
        sha256 "daef53e07b06c97ef7e563cfb8bd9fbccc4626cb2bb375f86dc428d37f174add"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aosguard-linux-amd64"
        sha256 "d993abee57c1122c7e659221322aaf6f87786371c630f1b8da1ee4630884776b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aterm-linux-amd64"
        sha256 "e09854b588280ccde46801b33a5804c40f03bfffd646efde571de5f7af34671d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aos-linux-arm64"
      sha256 "c2d03517beacbd36d6f331e85c42aa0d94bba74c35c0b416237121df4c6eea55"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aoscompose-linux-arm64"
        sha256 "c2d03517beacbd36d6f331e85c42aa0d94bba74c35c0b416237121df4c6eea55"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aosward-linux-arm64"
        sha256 "c2d03517beacbd36d6f331e85c42aa0d94bba74c35c0b416237121df4c6eea55"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aosguard-linux-arm64"
        sha256 "ec3b727d1926723b6e1355761bf709a04c0672fde5d615c81955bd1eca54cc17"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.406.0/aterm-linux-arm64"
        sha256 "c99b07dbff546f114252c4888fcf23b8f70c4ee5e8954e1c2e5a39b7c180eab1"
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
