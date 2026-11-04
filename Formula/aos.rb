class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.509.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aos-darwin-arm64"
    sha256 "b97da8395f69c79d1f41113653874c36b09f22213e7f3dcade6c946c9901dfed"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aoscompose-darwin-arm64"
      sha256 "b97da8395f69c79d1f41113653874c36b09f22213e7f3dcade6c946c9901dfed"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aosguard-darwin-arm64"
      sha256 "6245b679817c1a44c2e2d6ea86f8722077ffe1e495541f9f894356a327f35967"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aterm-darwin-arm64"
      sha256 "3449f9e414fe07fe0cd5261778c0b340b3482d36c86f364b29bf2c3b6e81a284"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aos-linux-amd64"
      sha256 "4d1d0b2bea38f05cc86f15a3f87ce84013897bc8e096981714cca09cbf86f87e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aoscompose-linux-amd64"
        sha256 "4d1d0b2bea38f05cc86f15a3f87ce84013897bc8e096981714cca09cbf86f87e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aosguard-linux-amd64"
        sha256 "6d28c3120b2dcd6295add49f996ba2d7485f5ee1292fa1ded976c582b223747d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aterm-linux-amd64"
        sha256 "5ebbcfbfc28118449c7817160ce56dc005af45fbae188146dde2330bac00d739"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aos-linux-arm64"
      sha256 "c19617f28b2ee0feaf5c4fffae65001278ba0c38fc853f0ee5f9f384287820e5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aoscompose-linux-arm64"
        sha256 "c19617f28b2ee0feaf5c4fffae65001278ba0c38fc853f0ee5f9f384287820e5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aosguard-linux-arm64"
        sha256 "8c6d920e1c769689a363f1d3535ab7cd18a286393828aa2cda6db245a2d8129d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.509.0/aterm-linux-arm64"
        sha256 "86f1e9bf8a6e06c1262cf8603c9e3a8e287a232129ed051a28561b85c3020799"
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
