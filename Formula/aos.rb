class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.317.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aos-darwin-arm64"
      sha256 "310602fb7659321aa099681f34365097060eac97420d5b669f224d5249bd5126"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aoscompose-darwin-arm64"
        sha256 "310602fb7659321aa099681f34365097060eac97420d5b669f224d5249bd5126"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aosward-darwin-arm64"
        sha256 "310602fb7659321aa099681f34365097060eac97420d5b669f224d5249bd5126"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aosguard-darwin-arm64"
        sha256 "8b4f311c2ceeed645b3214511b1c0495e7d02e9b7fc093dab34fcf5459134877"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aterm-darwin-arm64"
        sha256 "a50c2836b63943eb8451c13e293559f5b0fc8f91c390cb4913288c042eebc5cb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aos-linux-amd64"
      sha256 "fd8cfbde22793e066cd1c3160b6ff00ed38a1c0defbaf20156fe50a36d180627"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aoscompose-linux-amd64"
        sha256 "fd8cfbde22793e066cd1c3160b6ff00ed38a1c0defbaf20156fe50a36d180627"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aosward-linux-amd64"
        sha256 "fd8cfbde22793e066cd1c3160b6ff00ed38a1c0defbaf20156fe50a36d180627"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aosguard-linux-amd64"
        sha256 "2be2e9811d7998a66763bc8a9e1463f7827c0ab083b5c1dad20976f9ff2830cf"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aterm-linux-amd64"
        sha256 "fadc5a593cae8f683fb480d0b41df8ca2bccb9583a537a28fbe2719ae6f7519d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aos-linux-arm64"
      sha256 "5e73e0a88ce1daa5d771e62efd161b8601628a541f37db69dc31389cc7b9f019"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aoscompose-linux-arm64"
        sha256 "5e73e0a88ce1daa5d771e62efd161b8601628a541f37db69dc31389cc7b9f019"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aosward-linux-arm64"
        sha256 "5e73e0a88ce1daa5d771e62efd161b8601628a541f37db69dc31389cc7b9f019"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aosguard-linux-arm64"
        sha256 "1f9c6b1d9fd5fb12e9872b85ec7d8ea7297025b06691acf0aff337577ea0dd56"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.317.0/aterm-linux-arm64"
        sha256 "1347ff1cbb9a484a8ae7aa187eeec3f573488524c30e7b56624949b8d3d46e03"
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
