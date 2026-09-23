class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.351.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aos-darwin-arm64"
      sha256 "81b8e6be56285440f078209bed572b8b7c8ecdb11e6833e2f58c0e4520853106"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aoscompose-darwin-arm64"
        sha256 "81b8e6be56285440f078209bed572b8b7c8ecdb11e6833e2f58c0e4520853106"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aosward-darwin-arm64"
        sha256 "81b8e6be56285440f078209bed572b8b7c8ecdb11e6833e2f58c0e4520853106"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aosguard-darwin-arm64"
        sha256 "cb9627ded53631181e41840cddef59827b0421467be69f33244862835526b755"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aterm-darwin-arm64"
        sha256 "54311e12a6a9b6a548534206af06d8ec834a599d594266c8c8ea4e31365d52cf"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aos-linux-amd64"
      sha256 "1453f8666cf4ca324f5ec54c66f918c69dfd630b10fcf1bab5c3d00e39203d1c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aoscompose-linux-amd64"
        sha256 "1453f8666cf4ca324f5ec54c66f918c69dfd630b10fcf1bab5c3d00e39203d1c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aosward-linux-amd64"
        sha256 "1453f8666cf4ca324f5ec54c66f918c69dfd630b10fcf1bab5c3d00e39203d1c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aosguard-linux-amd64"
        sha256 "fe2394274de8fe3bbf67434356b1d51f0a5664fc0a7eda94be539f6301921d78"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aterm-linux-amd64"
        sha256 "4c3de2f336c20d6e0b112cb1bd8b6fe71f2ce5c49d2bd6740db2d58643d61d64"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aos-linux-arm64"
      sha256 "2c200dcdb93f144f4e462f08d1e11f5063c88e13348ec341a7c026357528b5ce"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aoscompose-linux-arm64"
        sha256 "2c200dcdb93f144f4e462f08d1e11f5063c88e13348ec341a7c026357528b5ce"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aosward-linux-arm64"
        sha256 "2c200dcdb93f144f4e462f08d1e11f5063c88e13348ec341a7c026357528b5ce"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aosguard-linux-arm64"
        sha256 "07dbe81ed1bda627949c93536a655b367f3e64a66958c298dbe9b12d7de9e557"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.351.0/aterm-linux-arm64"
        sha256 "9bd788669957d671c13c9ff27423c93368281c865287b3faef8cf50a675b265e"
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
