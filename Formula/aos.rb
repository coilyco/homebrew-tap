class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.359.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aos-darwin-arm64"
      sha256 "4189aa7e436b4892e3576859f596a3fd555168cef1588515983fa5632f9a2c87"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aoscompose-darwin-arm64"
        sha256 "4189aa7e436b4892e3576859f596a3fd555168cef1588515983fa5632f9a2c87"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aosward-darwin-arm64"
        sha256 "4189aa7e436b4892e3576859f596a3fd555168cef1588515983fa5632f9a2c87"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aosguard-darwin-arm64"
        sha256 "1bc8014d7fc656daccdd505324fce55e69124cf5c7e826fed3501383e8590dd6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aterm-darwin-arm64"
        sha256 "ea859ef2d3539689c542efcd5e74347855ccee09025096bf934b2c9c59b7575d"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aos-linux-amd64"
      sha256 "04ff4c8b0e1254e4cb662d110213359a9afb9fcdf4575326bb0b43aec23e18cd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aoscompose-linux-amd64"
        sha256 "04ff4c8b0e1254e4cb662d110213359a9afb9fcdf4575326bb0b43aec23e18cd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aosward-linux-amd64"
        sha256 "04ff4c8b0e1254e4cb662d110213359a9afb9fcdf4575326bb0b43aec23e18cd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aosguard-linux-amd64"
        sha256 "b074cdf499fc7521b933e85b0443a8f14bac9d1f3c196e714126557732e5906a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aterm-linux-amd64"
        sha256 "e9b52d9db02199cdf3cd81f492d14cc2142e517663a3d3c428dc20f4d9b04423"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aos-linux-arm64"
      sha256 "f4c6439ffcaf158c9b9d67a233e2cd5e3aac9361190e29116bc4591fd842d69c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aoscompose-linux-arm64"
        sha256 "f4c6439ffcaf158c9b9d67a233e2cd5e3aac9361190e29116bc4591fd842d69c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aosward-linux-arm64"
        sha256 "f4c6439ffcaf158c9b9d67a233e2cd5e3aac9361190e29116bc4591fd842d69c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aosguard-linux-arm64"
        sha256 "4e0092bc20f0b5ecfd2b93e02d967b364eae979ab0ab5e8b041c84ca2e7fa870"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.359.0/aterm-linux-arm64"
        sha256 "504b130e6a23deee8e52fd1d02aa6a334baf2ab97b0deada8a1e5f8a0977725b"
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
