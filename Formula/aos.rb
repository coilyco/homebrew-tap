class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.435.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aos-darwin-arm64"
      sha256 "b37a4c4e3bf9e1774d26bdb6b8cfe6b4c2ef8c60719b14c8bc18f5dbb5096e68"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aoscompose-darwin-arm64"
        sha256 "b37a4c4e3bf9e1774d26bdb6b8cfe6b4c2ef8c60719b14c8bc18f5dbb5096e68"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aosward-darwin-arm64"
        sha256 "b37a4c4e3bf9e1774d26bdb6b8cfe6b4c2ef8c60719b14c8bc18f5dbb5096e68"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aosguard-darwin-arm64"
        sha256 "0de1746b83f61ee0dffe0f4223799440a5ed850e4a64ead9b667db017116e8ff"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aterm-darwin-arm64"
        sha256 "1e68469f2758af0494ef8bf7daf2783ecce4e1fa665eedd2f00e306e1ce2ef1d"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aos-linux-amd64"
      sha256 "b74df46cb91056388bab777c0c9b0541d36992e7af568766c44e487de29f1cd6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aoscompose-linux-amd64"
        sha256 "b74df46cb91056388bab777c0c9b0541d36992e7af568766c44e487de29f1cd6"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aosward-linux-amd64"
        sha256 "b74df46cb91056388bab777c0c9b0541d36992e7af568766c44e487de29f1cd6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aosguard-linux-amd64"
        sha256 "5918903312a2ecc2a36a61e8ef4815868305945460e2fdabe7367a5664821d52"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aterm-linux-amd64"
        sha256 "8a0008fb225e466433166b16cd2d3f5191734bd63a9b38ac19bb22b201db6852"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aos-linux-arm64"
      sha256 "8a52ddef4d93d001bf0d3d321b4b8979beaefd91f9f8fa59e38a5efbbf31db2d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aoscompose-linux-arm64"
        sha256 "8a52ddef4d93d001bf0d3d321b4b8979beaefd91f9f8fa59e38a5efbbf31db2d"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aosward-linux-arm64"
        sha256 "8a52ddef4d93d001bf0d3d321b4b8979beaefd91f9f8fa59e38a5efbbf31db2d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aosguard-linux-arm64"
        sha256 "1998adc5dfee7d43f532b016cd500f4b83f821d878af7df986a8f0ee132f901f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.435.0/aterm-linux-arm64"
        sha256 "a21e38ea31d7f66baf20b1591e9601bc8a4f566a1e31bf734104dd79eaf31e1c"
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
