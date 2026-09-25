class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.379.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aos-darwin-arm64"
      sha256 "ad178a15114307e6b4c48916f2a209be007342f4384e7abfee0190d0e167eab5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aoscompose-darwin-arm64"
        sha256 "ad178a15114307e6b4c48916f2a209be007342f4384e7abfee0190d0e167eab5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aosward-darwin-arm64"
        sha256 "ad178a15114307e6b4c48916f2a209be007342f4384e7abfee0190d0e167eab5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aosguard-darwin-arm64"
        sha256 "c2515f46907de6a105b228704edda59d4dff3e41f268b985a64c23625086dff1"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aterm-darwin-arm64"
        sha256 "e8a096f3bb0f89fc0110a2346f3f98e563a3320054c59760c47da4194239a101"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aos-linux-amd64"
      sha256 "c92530b0dbf1749ab09602cf4aff73ef30c11568b0495218c68e4cda44cc57f4"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aoscompose-linux-amd64"
        sha256 "c92530b0dbf1749ab09602cf4aff73ef30c11568b0495218c68e4cda44cc57f4"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aosward-linux-amd64"
        sha256 "c92530b0dbf1749ab09602cf4aff73ef30c11568b0495218c68e4cda44cc57f4"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aosguard-linux-amd64"
        sha256 "894bfec166aafec94e96914f1c29c6ecb8b7eb436a77f635f801408b8478e16b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aterm-linux-amd64"
        sha256 "9f306b249756d5696345f8d9cf104a768f5560acd1406a11fb6ac7dc34ddd265"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aos-linux-arm64"
      sha256 "a7a8fc0a6780f933a6d3065d7155d9a3837fda7bdf206bae6ab92a0c178a908b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aoscompose-linux-arm64"
        sha256 "a7a8fc0a6780f933a6d3065d7155d9a3837fda7bdf206bae6ab92a0c178a908b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aosward-linux-arm64"
        sha256 "a7a8fc0a6780f933a6d3065d7155d9a3837fda7bdf206bae6ab92a0c178a908b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aosguard-linux-arm64"
        sha256 "c5cad4694db920da456c46021f48f56aa0e7aece697ae3766c229c1f25989a43"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.379.0/aterm-linux-arm64"
        sha256 "8f6e6338c8122f3581c23faf506577042aed3b7a9e1fcdef959bbeac6c284d85"
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
