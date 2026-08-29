class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.274.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aos-darwin-arm64"
      sha256 "4cc771c5626c1c0a397600f814c8b3cbd2efecdcb56a33084cd766666de5b737"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aoscompose-darwin-arm64"
        sha256 "4cc771c5626c1c0a397600f814c8b3cbd2efecdcb56a33084cd766666de5b737"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aosward-darwin-arm64"
        sha256 "4cc771c5626c1c0a397600f814c8b3cbd2efecdcb56a33084cd766666de5b737"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aosguard-darwin-arm64"
        sha256 "d014768061c64b6b3cce2a70fb6641add2fc96fabe1a4c6ea03b6a1d3a602baf"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aterm-darwin-arm64"
        sha256 "79f021e3f6f778fbfe0cc9021f91d40efd9802b37c20bfe191db6ee5ea802605"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aos-linux-amd64"
      sha256 "5f684566e72374c886052dd0ab7847da4af30f0f96e2d2c2434dfe87845b5acf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aoscompose-linux-amd64"
        sha256 "5f684566e72374c886052dd0ab7847da4af30f0f96e2d2c2434dfe87845b5acf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aosward-linux-amd64"
        sha256 "5f684566e72374c886052dd0ab7847da4af30f0f96e2d2c2434dfe87845b5acf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aosguard-linux-amd64"
        sha256 "e6d4c00505e17fc1a383a3105e6301292202cebb9a541eadeb1dff6e5c5eba3a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aterm-linux-amd64"
        sha256 "47b1b333576b0875f8055906d50a7dbe628c3af204e83cdba2607bcb36ddca37"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aos-linux-arm64"
      sha256 "5f20a53c65f7dbd2c4e3fdd3ce4390eceb688c77ba2011422f24365769fcd4d9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aoscompose-linux-arm64"
        sha256 "5f20a53c65f7dbd2c4e3fdd3ce4390eceb688c77ba2011422f24365769fcd4d9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aosward-linux-arm64"
        sha256 "5f20a53c65f7dbd2c4e3fdd3ce4390eceb688c77ba2011422f24365769fcd4d9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aosguard-linux-arm64"
        sha256 "053a9b334417106abac393c55957532718deaa492b5010b0f9da854d5a89f951"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.274.0/aterm-linux-arm64"
        sha256 "3fab3a2091c2ee3835ef071b762abd4caa71a8d67bdfdeaf3a5ab23b37f905fe"
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
