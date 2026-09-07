class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.308.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aos-darwin-arm64"
      sha256 "57c05fb060b0babf30ab66ac8ad083d277762f5bd037869204009b79fab7a608"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aoscompose-darwin-arm64"
        sha256 "57c05fb060b0babf30ab66ac8ad083d277762f5bd037869204009b79fab7a608"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aosward-darwin-arm64"
        sha256 "57c05fb060b0babf30ab66ac8ad083d277762f5bd037869204009b79fab7a608"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aosguard-darwin-arm64"
        sha256 "9bffe2fa8a4aef62e126cdc62f4a3f073de2a6281c7b25d9ff4acf3d629d7056"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aterm-darwin-arm64"
        sha256 "2518c7df0efbf1b74cd586decf82a16339cd4afcb720c1d7fe3cf6a435f6f382"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aos-linux-amd64"
      sha256 "308b13c3351c2d9505a84dadd5b1d5b35caf611b38c3a5c28f8d5be260872e25"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aoscompose-linux-amd64"
        sha256 "308b13c3351c2d9505a84dadd5b1d5b35caf611b38c3a5c28f8d5be260872e25"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aosward-linux-amd64"
        sha256 "308b13c3351c2d9505a84dadd5b1d5b35caf611b38c3a5c28f8d5be260872e25"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aosguard-linux-amd64"
        sha256 "959cc4775354d4c6a9a5efc6dea962e054a9eb487a4c02d76648c3898a91e566"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aterm-linux-amd64"
        sha256 "57e5da8d1ca3d922b11e53c8cbbaea8c2cab285ad38fe653520e6984398ea572"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aos-linux-arm64"
      sha256 "aa74ce3216b4fa0589077bf6cbaca00379ee9577289aec07f5d57f751eab0b71"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aoscompose-linux-arm64"
        sha256 "aa74ce3216b4fa0589077bf6cbaca00379ee9577289aec07f5d57f751eab0b71"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aosward-linux-arm64"
        sha256 "aa74ce3216b4fa0589077bf6cbaca00379ee9577289aec07f5d57f751eab0b71"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aosguard-linux-arm64"
        sha256 "d9b3a2c52e531e242267b6cf2982259b789a381e1b1e03eac62979989ba5a913"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.308.0/aterm-linux-arm64"
        sha256 "5b204f5da6034f65a1ae351e3525c06cfa2a5f19e09bd62613ca5bc9648b4c95"
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
