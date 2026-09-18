class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.340.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aos-darwin-arm64"
      sha256 "8520a8ba7759de6338e9eaa9711ad416d01cf265704c38b8bdb4b49988b3e9bf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aoscompose-darwin-arm64"
        sha256 "8520a8ba7759de6338e9eaa9711ad416d01cf265704c38b8bdb4b49988b3e9bf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aosward-darwin-arm64"
        sha256 "8520a8ba7759de6338e9eaa9711ad416d01cf265704c38b8bdb4b49988b3e9bf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aosguard-darwin-arm64"
        sha256 "3f8f1af93c2f586bc308d5a67ff481c26f73607664287309cdc7abc51c703218"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aterm-darwin-arm64"
        sha256 "3f43112a856b5c5ad8a93ab437ff600fd803d1b2a40fcc287492374f2b7c53e3"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aos-linux-amd64"
      sha256 "d5a7d4d6156ea42acdb4b98f62803aeab009c97300dbf9248a7e2c5547a42f6d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aoscompose-linux-amd64"
        sha256 "d5a7d4d6156ea42acdb4b98f62803aeab009c97300dbf9248a7e2c5547a42f6d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aosward-linux-amd64"
        sha256 "d5a7d4d6156ea42acdb4b98f62803aeab009c97300dbf9248a7e2c5547a42f6d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aosguard-linux-amd64"
        sha256 "030a7b338a1d5379dbddddc8eb2d2e7af1b687fe1fcea0925fa27099ded9312d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aterm-linux-amd64"
        sha256 "77607328a5f533d72a5a87ee661eabe66047ff40ed9d4d833e4e96061704e427"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aos-linux-arm64"
      sha256 "eb591934cc28982d6f1a02915b8bad723ed36a8e3fe367f582e98057ffb72169"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aoscompose-linux-arm64"
        sha256 "eb591934cc28982d6f1a02915b8bad723ed36a8e3fe367f582e98057ffb72169"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aosward-linux-arm64"
        sha256 "eb591934cc28982d6f1a02915b8bad723ed36a8e3fe367f582e98057ffb72169"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aosguard-linux-arm64"
        sha256 "295ce5deb9ab04e6ec97ea62e9ba2e89e2e2d44d41dd244e5df48668bbd5ae42"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.340.0/aterm-linux-arm64"
        sha256 "bd63e33d1ab570f96ad25ca0cb4a4b4d57bfc70bf24fe9ebd7968dd7a3500e22"
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
