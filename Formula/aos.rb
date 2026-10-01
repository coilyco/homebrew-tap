class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.410.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aos-darwin-arm64"
      sha256 "4d4d6e9c20f13ee4ba68262dda2f13e587e26da872aac151a14696397694aa7b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aoscompose-darwin-arm64"
        sha256 "4d4d6e9c20f13ee4ba68262dda2f13e587e26da872aac151a14696397694aa7b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aosward-darwin-arm64"
        sha256 "4d4d6e9c20f13ee4ba68262dda2f13e587e26da872aac151a14696397694aa7b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aosguard-darwin-arm64"
        sha256 "175c3ec1286b905701a00a45100653293342f871815dcdf447279eeae9be8e2f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aterm-darwin-arm64"
        sha256 "be5b29a60c17b0ec48fec4ad3b9324ffa9882341fcadfa66e3b25e7267263ffc"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aos-linux-amd64"
      sha256 "176f6f75a518255ff9975f60c95dac16f15974be8033adb6cb99d9d26db62751"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aoscompose-linux-amd64"
        sha256 "176f6f75a518255ff9975f60c95dac16f15974be8033adb6cb99d9d26db62751"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aosward-linux-amd64"
        sha256 "176f6f75a518255ff9975f60c95dac16f15974be8033adb6cb99d9d26db62751"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aosguard-linux-amd64"
        sha256 "e793ebfaff4f34ca8d217bc1643df6718076d819ce193ade20392a1f4db394c7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aterm-linux-amd64"
        sha256 "de683b660e10f8ee65fe6d6639dca74a93064c01c1dde17b366d55d82199e8f3"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aos-linux-arm64"
      sha256 "fdff1b91a5ba28cb781fdb47c4ac7b06d5a9ec829eb043f3189fa94120384149"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aoscompose-linux-arm64"
        sha256 "fdff1b91a5ba28cb781fdb47c4ac7b06d5a9ec829eb043f3189fa94120384149"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aosward-linux-arm64"
        sha256 "fdff1b91a5ba28cb781fdb47c4ac7b06d5a9ec829eb043f3189fa94120384149"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aosguard-linux-arm64"
        sha256 "594c955a8209249cfda09d5cb2077f67b86a341e8cc9fbc43774bf83e34e6699"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.410.0/aterm-linux-arm64"
        sha256 "83355d76afc537cf64ab9abfaa8d227847f30d006dbf2f1422b528d7cf7fa5cb"
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
