class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.518.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aos-darwin-arm64"
    sha256 "db8900a8e71b9c8450f40d2bbc63f105ae2bbc0462cc5a20f0db791eac0c0a7a"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aoscompose-darwin-arm64"
      sha256 "db8900a8e71b9c8450f40d2bbc63f105ae2bbc0462cc5a20f0db791eac0c0a7a"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aosguard-darwin-arm64"
      sha256 "7a7b1c812926713e3d377c2281b0504aad4bc6355b1bafb04feeea25a482c6de"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aterm-darwin-arm64"
      sha256 "5593405a2f8fa044c0b77b4d4e6989a804aff535dd0e8b6bb1b0da12bb8c7c8d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aos-linux-amd64"
      sha256 "e475ce1d01b0369c5007089ba639dae607279773e1cbe3e7aef1fd93fe85ce77"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aoscompose-linux-amd64"
        sha256 "e475ce1d01b0369c5007089ba639dae607279773e1cbe3e7aef1fd93fe85ce77"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aosguard-linux-amd64"
        sha256 "da15b9dfb7ed4298cfd96e85bb0fdf20738d0cf8ddbcbc9d71b34cb51246e619"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aterm-linux-amd64"
        sha256 "55ab7600f3e5f575700c36fd6ad007901337624d222489dd4304b067a61fc2da"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aos-linux-arm64"
      sha256 "6d08480c1c573a59c364f28cbc3dca56693c4aecd661475716e38d2a8f4e2477"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aoscompose-linux-arm64"
        sha256 "6d08480c1c573a59c364f28cbc3dca56693c4aecd661475716e38d2a8f4e2477"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aosguard-linux-arm64"
        sha256 "d054f966caad39d7fb5609ecaa65120649f885e70f3c647c2a752a6ca0c1749e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.518.0/aterm-linux-arm64"
        sha256 "818090cbe9b4696f2ad92be9109f6b15f53b3e78b01b39961abb74d5a0b8cf1a"
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
