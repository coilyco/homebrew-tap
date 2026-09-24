class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.363.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aos-darwin-arm64"
      sha256 "45e092b713c020cc1f9321051a0d235eb0982ea564b9ea533c4a17111174717e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aoscompose-darwin-arm64"
        sha256 "45e092b713c020cc1f9321051a0d235eb0982ea564b9ea533c4a17111174717e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aosward-darwin-arm64"
        sha256 "45e092b713c020cc1f9321051a0d235eb0982ea564b9ea533c4a17111174717e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aosguard-darwin-arm64"
        sha256 "9053398b2e000590996ca47652c38763bf4ae3685af4f8984e2fa25a9094bef7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aterm-darwin-arm64"
        sha256 "74d5fdf9d4fe90b5c0aafea0a8f6c85c5ad4d63ae6cdc7eb9be57ae704520b75"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aos-linux-amd64"
      sha256 "9b363e79436809ca1f7f73a18e79e087c8db4e90c73a5c196d679036eb5b3ed2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aoscompose-linux-amd64"
        sha256 "9b363e79436809ca1f7f73a18e79e087c8db4e90c73a5c196d679036eb5b3ed2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aosward-linux-amd64"
        sha256 "9b363e79436809ca1f7f73a18e79e087c8db4e90c73a5c196d679036eb5b3ed2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aosguard-linux-amd64"
        sha256 "ddb6bf8cd58bb5893f920535c05db37987ca825e2b4d42dc4d5721676885aafa"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aterm-linux-amd64"
        sha256 "3cedaa547f8b442d761f3c9fbdc9343888dfa4be518970b7988475bafab5431a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aos-linux-arm64"
      sha256 "febe8014af65bb9472581543910d1908809b6738592227c38e22b30f2d52cd90"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aoscompose-linux-arm64"
        sha256 "febe8014af65bb9472581543910d1908809b6738592227c38e22b30f2d52cd90"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aosward-linux-arm64"
        sha256 "febe8014af65bb9472581543910d1908809b6738592227c38e22b30f2d52cd90"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aosguard-linux-arm64"
        sha256 "5c96ab005dfbc6eac76ddd86ef0a0f269a409457489d3b86d2ae47cb278b6d2e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.363.0/aterm-linux-arm64"
        sha256 "245b92a4008c0010240e0a550c55a32b080c09415419881d5561786a40fe9982"
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
