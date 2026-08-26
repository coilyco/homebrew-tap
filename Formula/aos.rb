class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.234.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aos-darwin-arm64"
      sha256 "a2afe67a0b2fbe95c5d754f616fecedebe4205374de1a400c61ba1aa35849ebe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aoscompose-darwin-arm64"
        sha256 "a2afe67a0b2fbe95c5d754f616fecedebe4205374de1a400c61ba1aa35849ebe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aosward-darwin-arm64"
        sha256 "a2afe67a0b2fbe95c5d754f616fecedebe4205374de1a400c61ba1aa35849ebe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aosguard-darwin-arm64"
        sha256 "fc31b2822188bce8b7973721775fb3dc545f1cd82a26e5c0abf61a295d5e4596"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aterm-darwin-arm64"
        sha256 "3f13324ff339c8c5082afea0f0b117537f08854846d5c8f00de20e366de2c5c6"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aos-linux-amd64"
      sha256 "3836e7eedff99a3dbd83f5d19f08a0f684a078a836713ea7a2fc4282c6caff90"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aoscompose-linux-amd64"
        sha256 "3836e7eedff99a3dbd83f5d19f08a0f684a078a836713ea7a2fc4282c6caff90"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aosward-linux-amd64"
        sha256 "3836e7eedff99a3dbd83f5d19f08a0f684a078a836713ea7a2fc4282c6caff90"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aosguard-linux-amd64"
        sha256 "55c53ce80222a6b65a240f0a9120f7334c9f807086f29a78dc8a6b217590bdde"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aterm-linux-amd64"
        sha256 "d8e86de9cb2c52d7a54a4a2a6ad3b2cb088fcb4fe6773d991f0f4b79defb976c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aos-linux-arm64"
      sha256 "b79b1cfb6094a8f499b4b7f55de175ae51fcd605ec38226e1bff103aa6048625"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aoscompose-linux-arm64"
        sha256 "b79b1cfb6094a8f499b4b7f55de175ae51fcd605ec38226e1bff103aa6048625"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aosward-linux-arm64"
        sha256 "b79b1cfb6094a8f499b4b7f55de175ae51fcd605ec38226e1bff103aa6048625"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aosguard-linux-arm64"
        sha256 "487ec0c608599bc2b66313d3374a55cbde0116961e31828019b028bda6d99494"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.234.0/aterm-linux-arm64"
        sha256 "73d5e4130fbc9c9f7162af76c968c99348372ab77dc7057a43ed0fb6c6bf0e82"
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
