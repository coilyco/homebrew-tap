class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.362.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aos-darwin-arm64"
      sha256 "c7d7f7babb4d0b6ad83e5484f0fb8d28834e1019716f0b5323119eae11faba9f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aoscompose-darwin-arm64"
        sha256 "c7d7f7babb4d0b6ad83e5484f0fb8d28834e1019716f0b5323119eae11faba9f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aosward-darwin-arm64"
        sha256 "c7d7f7babb4d0b6ad83e5484f0fb8d28834e1019716f0b5323119eae11faba9f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aosguard-darwin-arm64"
        sha256 "101bcc9ffece64bc94931a69826ddf32adc999a78bf4460b6df93e101950cbeb"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aterm-darwin-arm64"
        sha256 "90389a42e507f89a92e1682393ff4a76e5e712226cbc5fd7613469309020f78b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aos-linux-amd64"
      sha256 "9c7bcb699cda4d86d9f7e26ae109f8dc62afb8fb0356673b1a5d2f095492abeb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aoscompose-linux-amd64"
        sha256 "9c7bcb699cda4d86d9f7e26ae109f8dc62afb8fb0356673b1a5d2f095492abeb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aosward-linux-amd64"
        sha256 "9c7bcb699cda4d86d9f7e26ae109f8dc62afb8fb0356673b1a5d2f095492abeb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aosguard-linux-amd64"
        sha256 "1dda7de7c1cd9f3750821522448c11c8d0ef5267c1426edfaad47d52c00294f4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aterm-linux-amd64"
        sha256 "bb2870b0160e86803cafce7373ffd9ac9a7f72896b31dd16269cd96c1226d029"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aos-linux-arm64"
      sha256 "a9179f4a2ad3d03ffcfde9dcf03d2be9d5e3b16e58f21c1a39b5194568e5afd3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aoscompose-linux-arm64"
        sha256 "a9179f4a2ad3d03ffcfde9dcf03d2be9d5e3b16e58f21c1a39b5194568e5afd3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aosward-linux-arm64"
        sha256 "a9179f4a2ad3d03ffcfde9dcf03d2be9d5e3b16e58f21c1a39b5194568e5afd3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aosguard-linux-arm64"
        sha256 "e31ac6a15ed679588fe31661eb2637c80841fc5673208cab8484b0175ca1e75c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.362.0/aterm-linux-arm64"
        sha256 "28aa2b15481dd844663b952894e3d6a6b255b971f47663232b0122ef8867e949"
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
