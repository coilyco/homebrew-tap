class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.303.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aos-darwin-arm64"
      sha256 "db740205e462b5a5b8bae1877a16650907ddca983cb631259ca006b60576a66f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aoscompose-darwin-arm64"
        sha256 "db740205e462b5a5b8bae1877a16650907ddca983cb631259ca006b60576a66f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aosward-darwin-arm64"
        sha256 "db740205e462b5a5b8bae1877a16650907ddca983cb631259ca006b60576a66f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aosguard-darwin-arm64"
        sha256 "e64c5519d8d2ce912cba9d5afccdaf15d9dfca443e26109823d9c159fd2268dd"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aterm-darwin-arm64"
        sha256 "10ae91c1072d24cab0181dab0f6e96446992d5324cd1cfa4406a9cc1fe733aec"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aos-linux-amd64"
      sha256 "270ecd56da815f8f55b8744ff784aea5524d66c811f36d308e17425090499c19"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aoscompose-linux-amd64"
        sha256 "270ecd56da815f8f55b8744ff784aea5524d66c811f36d308e17425090499c19"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aosward-linux-amd64"
        sha256 "270ecd56da815f8f55b8744ff784aea5524d66c811f36d308e17425090499c19"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aosguard-linux-amd64"
        sha256 "ec1d20db1ab2abf24fb7b11eac352b5d3c4dc9bde948eac29ae53d835169884d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aterm-linux-amd64"
        sha256 "637c777595b8722eadd34dc069052199fbac31a6878f322793ddbf8c2affdc2d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aos-linux-arm64"
      sha256 "fd72d31235e3446f28ca94a248bf680de19e745af8c1964be6394e0cf96f7c67"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aoscompose-linux-arm64"
        sha256 "fd72d31235e3446f28ca94a248bf680de19e745af8c1964be6394e0cf96f7c67"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aosward-linux-arm64"
        sha256 "fd72d31235e3446f28ca94a248bf680de19e745af8c1964be6394e0cf96f7c67"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aosguard-linux-arm64"
        sha256 "03ee37fcd7476d3acf67b0a9da9e93956785393655c20464166196f75992593e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.303.0/aterm-linux-arm64"
        sha256 "815cfb5105a25ad32111c4d0e543fd9da1e007b555c2b48d748b3b6459a7cbe9"
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
