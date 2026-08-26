class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.245.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aos-darwin-arm64"
      sha256 "8ec63e5d682f4c6f09b2b1bed63bf54d31db315a2ddc8f36b4050bedfed8d4b3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aoscompose-darwin-arm64"
        sha256 "8ec63e5d682f4c6f09b2b1bed63bf54d31db315a2ddc8f36b4050bedfed8d4b3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aosward-darwin-arm64"
        sha256 "8ec63e5d682f4c6f09b2b1bed63bf54d31db315a2ddc8f36b4050bedfed8d4b3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aosguard-darwin-arm64"
        sha256 "d0a6cf8907a762450029f6d76a2833ba9b5aa2f4a3728636e03a2c219143a3cd"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aterm-darwin-arm64"
        sha256 "16e3ec39ce6273fa5901a5dd51888662e3ad448b211d8eda2b11e719a7d80cca"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aos-linux-amd64"
      sha256 "399cc645c8237bbd80bff4181ba8aa36cb245ecf2ca4cd36b42e31afb6a3376e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aoscompose-linux-amd64"
        sha256 "399cc645c8237bbd80bff4181ba8aa36cb245ecf2ca4cd36b42e31afb6a3376e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aosward-linux-amd64"
        sha256 "399cc645c8237bbd80bff4181ba8aa36cb245ecf2ca4cd36b42e31afb6a3376e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aosguard-linux-amd64"
        sha256 "404602c6553b9840f7f8f169b4a56615cdae1d2259d33fa6cce96f59acef259d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aterm-linux-amd64"
        sha256 "4969038da343ed881b57aadb33141a3ae4ee3835bdabc42c2617e292d143c8c5"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aos-linux-arm64"
      sha256 "9798f3e330e40002345b7a5d1ae2352db57a3a70261d81bc838d115fe90af4b9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aoscompose-linux-arm64"
        sha256 "9798f3e330e40002345b7a5d1ae2352db57a3a70261d81bc838d115fe90af4b9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aosward-linux-arm64"
        sha256 "9798f3e330e40002345b7a5d1ae2352db57a3a70261d81bc838d115fe90af4b9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aosguard-linux-arm64"
        sha256 "e5cd21976761ac3476bc8b1eb05797b81f49375f90407ae46f8a2ac1bf972e33"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.245.0/aterm-linux-arm64"
        sha256 "1090b3427a8491d2272792b63592f7f0639cf19963424cc1b9120b9ec65dcdb5"
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
