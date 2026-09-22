class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.349.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aos-darwin-arm64"
      sha256 "6b3dd4143bbcea3487160f9579c74f88a32dd93cc359f6f7a4651876099f9ff7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aoscompose-darwin-arm64"
        sha256 "6b3dd4143bbcea3487160f9579c74f88a32dd93cc359f6f7a4651876099f9ff7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aosward-darwin-arm64"
        sha256 "6b3dd4143bbcea3487160f9579c74f88a32dd93cc359f6f7a4651876099f9ff7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aosguard-darwin-arm64"
        sha256 "d8b6ad885f234fb2d4aeed077a89c35a9809d75bb11c5c7b7202d7984168ffcf"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aterm-darwin-arm64"
        sha256 "2f06c462a1d5952e6c00b8027f9d79421f0fbe74d124b782a83cd604c21b9f53"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aos-linux-amd64"
      sha256 "150251e26a6def43f0b116c9fcc59b65226ce460905a852a321ceda9720dabed"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aoscompose-linux-amd64"
        sha256 "150251e26a6def43f0b116c9fcc59b65226ce460905a852a321ceda9720dabed"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aosward-linux-amd64"
        sha256 "150251e26a6def43f0b116c9fcc59b65226ce460905a852a321ceda9720dabed"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aosguard-linux-amd64"
        sha256 "ad386cdf5d09b9b4da88a8344250c5d94d3de586a6821984e001af922dc01c70"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aterm-linux-amd64"
        sha256 "e28a03a8611211fd4f5e6783c68ba261e15703232789be94cfd772581c8ec596"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aos-linux-arm64"
      sha256 "878780162880a19127842763f27e1e98446163dd26f3d4d16f38a02e67cf7053"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aoscompose-linux-arm64"
        sha256 "878780162880a19127842763f27e1e98446163dd26f3d4d16f38a02e67cf7053"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aosward-linux-arm64"
        sha256 "878780162880a19127842763f27e1e98446163dd26f3d4d16f38a02e67cf7053"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aosguard-linux-arm64"
        sha256 "54203037eab16f21369483f83919439e52cc2cb5fe9aeea7f2e5e365557cc573"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.349.0/aterm-linux-arm64"
        sha256 "ab1c0e477b595d9f484559ddad00f4785955422fe331baaaa83ddd17b3888097"
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
