class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.332.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aos-darwin-arm64"
      sha256 "2f14c295a68db7f72c9a3b23d331e3208cc8920e4d640b2973089d129503cc7d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aoscompose-darwin-arm64"
        sha256 "2f14c295a68db7f72c9a3b23d331e3208cc8920e4d640b2973089d129503cc7d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aosward-darwin-arm64"
        sha256 "2f14c295a68db7f72c9a3b23d331e3208cc8920e4d640b2973089d129503cc7d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aosguard-darwin-arm64"
        sha256 "63a5659ba504ff9896d2c278a57fe5fb7639ad23b510926d9efb28eba5690436"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aterm-darwin-arm64"
        sha256 "d1b2ab62c20176b9589cf01a971aa8c534266abd5810f09882092ae715b2e0f9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aos-linux-amd64"
      sha256 "e648e90da8ac5635ec49ee9b568a44bd748bd002058200b60880bc100681ee72"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aoscompose-linux-amd64"
        sha256 "e648e90da8ac5635ec49ee9b568a44bd748bd002058200b60880bc100681ee72"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aosward-linux-amd64"
        sha256 "e648e90da8ac5635ec49ee9b568a44bd748bd002058200b60880bc100681ee72"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aosguard-linux-amd64"
        sha256 "a489360ab29a2656bffc35c11d19281dab2ea43b139a6577e549e262b0f8b22c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aterm-linux-amd64"
        sha256 "d7f765fdb7bddb0cd662f314faad5bac0f521036d87a9b95f074f633a6a49b3c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aos-linux-arm64"
      sha256 "031447f7147590616dd9f65d2263adce81fc9705538466558fe3ff883502393e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aoscompose-linux-arm64"
        sha256 "031447f7147590616dd9f65d2263adce81fc9705538466558fe3ff883502393e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aosward-linux-arm64"
        sha256 "031447f7147590616dd9f65d2263adce81fc9705538466558fe3ff883502393e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aosguard-linux-arm64"
        sha256 "c9e0ff0b9818197a5d33b37f4af7acdd1962cd8c2bf910d9f7060f37817dfdb2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.332.0/aterm-linux-arm64"
        sha256 "0ef6be006a4a7138dff8f417811ff1bb57fbace42425f8123a9d96faa4b638f2"
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
