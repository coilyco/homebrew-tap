class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.251.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aos-darwin-arm64"
      sha256 "e0878bbdcb2cd29ee63c734e13dd33215173d9e0c177814ddd2b44b7a64d9ca2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aoscompose-darwin-arm64"
        sha256 "e0878bbdcb2cd29ee63c734e13dd33215173d9e0c177814ddd2b44b7a64d9ca2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aosward-darwin-arm64"
        sha256 "e0878bbdcb2cd29ee63c734e13dd33215173d9e0c177814ddd2b44b7a64d9ca2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aosguard-darwin-arm64"
        sha256 "8e678bc0e12efe6e33cf5de6474bec4a8ccc4d7173ce85739583d37a903f70a7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aterm-darwin-arm64"
        sha256 "2ed6ff483ed483738b47ce70d7bba255c1abdda57d291d85996f730679889f40"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aos-linux-amd64"
      sha256 "bfd3d4dc504d64a481de9e2b3fde10583ba63e9b3755798d42ee30431218536a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aoscompose-linux-amd64"
        sha256 "bfd3d4dc504d64a481de9e2b3fde10583ba63e9b3755798d42ee30431218536a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aosward-linux-amd64"
        sha256 "bfd3d4dc504d64a481de9e2b3fde10583ba63e9b3755798d42ee30431218536a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aosguard-linux-amd64"
        sha256 "9a6caa0e60365c30d148bd0c66c57a3abf83e4566771c06364c8f30662708760"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aterm-linux-amd64"
        sha256 "4281397fcc1a140cc37958df9a65a33bfd66e53540f53e222d62c81138f3cc7e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aos-linux-arm64"
      sha256 "0a490f2e5d9e173a40e90d63eeeed0e9059e3e49dc97d3edd7c180e385150725"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aoscompose-linux-arm64"
        sha256 "0a490f2e5d9e173a40e90d63eeeed0e9059e3e49dc97d3edd7c180e385150725"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aosward-linux-arm64"
        sha256 "0a490f2e5d9e173a40e90d63eeeed0e9059e3e49dc97d3edd7c180e385150725"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aosguard-linux-arm64"
        sha256 "33f0cb1a6c04d44d2a7a3d080d0d8d8ec06017a98b7d18646cad595d6653689a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.251.0/aterm-linux-arm64"
        sha256 "a9c62b817eb1bd8419124ced747b24a600fa264d308bc917a98078ad5c7c8117"
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
