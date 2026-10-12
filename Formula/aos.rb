class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.475.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aos-darwin-arm64"
      sha256 "6b8b0471129d21d3a72a4925d25518834b9a7f448ac2753f3a8ad6bf8bb031f3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aoscompose-darwin-arm64"
        sha256 "6b8b0471129d21d3a72a4925d25518834b9a7f448ac2753f3a8ad6bf8bb031f3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aosguard-darwin-arm64"
        sha256 "86e2b89f9e815fd23dff280467f28118a2aa99311ecdb8eecefa984a64bd67b7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aterm-darwin-arm64"
        sha256 "39f7927d1cf21d2ef13071f9da8267605e365595bfdae498bbaa4dd701015369"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aos-linux-amd64"
      sha256 "d44c178247efdc05d399ee728d4f7dcf3413b16e8ff0aedf105bcf71d39d6d77"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aoscompose-linux-amd64"
        sha256 "d44c178247efdc05d399ee728d4f7dcf3413b16e8ff0aedf105bcf71d39d6d77"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aosguard-linux-amd64"
        sha256 "ac80c687b5aa865b4013b0479c488b7de82e6152ea2ca7d3c7f53c306b1b1c20"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aterm-linux-amd64"
        sha256 "f748500ba1b22ece1e0bbe5cd0ae577adeaa1b7a3d49b5fb797eba82b4534518"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aos-linux-arm64"
      sha256 "624d475b8913c9eececbb34215fe2ae5660e3053696267a826fc911984f21647"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aoscompose-linux-arm64"
        sha256 "624d475b8913c9eececbb34215fe2ae5660e3053696267a826fc911984f21647"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aosguard-linux-arm64"
        sha256 "395193a3d4fb4615a5992b7527af55348122fa2d4665676d8cba41e083fa8b60"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.475.0/aterm-linux-arm64"
        sha256 "61c982f25d1d74a8a1a71925c020911c1d45658cf812de63b6a813d81c5dbb5a"
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
