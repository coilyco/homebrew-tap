class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.335.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aos-darwin-arm64"
      sha256 "8f3df3a0963b538b82618fbfe97c8f09edab22831c79da6433a7bf897fbdb0ec"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aoscompose-darwin-arm64"
        sha256 "8f3df3a0963b538b82618fbfe97c8f09edab22831c79da6433a7bf897fbdb0ec"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aosward-darwin-arm64"
        sha256 "8f3df3a0963b538b82618fbfe97c8f09edab22831c79da6433a7bf897fbdb0ec"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aosguard-darwin-arm64"
        sha256 "d18bfb456b32399f0b8ca0aaed17881939ecfcb449f1628233a8efe9146deff8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aterm-darwin-arm64"
        sha256 "89177080af4d359ab0a94e2b9ef071ad6381c532e48347888c49866fa22247e2"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aos-linux-amd64"
      sha256 "2895ec88c14aaab70573878382b33c53591a47b6c7cb1c81872ddd197f324b6d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aoscompose-linux-amd64"
        sha256 "2895ec88c14aaab70573878382b33c53591a47b6c7cb1c81872ddd197f324b6d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aosward-linux-amd64"
        sha256 "2895ec88c14aaab70573878382b33c53591a47b6c7cb1c81872ddd197f324b6d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aosguard-linux-amd64"
        sha256 "619e7f7d0c88e42fdc0c9906af40116c516d2df3ccba1f464c684c5b4d00d1f3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aterm-linux-amd64"
        sha256 "8139a88fb17ef0adf028d35acba9352315738d28dc9129ce6df2ea1b5e2d04fb"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aos-linux-arm64"
      sha256 "a770bbee14b3d8bf7a8e51e138d40c07a8ccd8068163d640f18508af15a0efd6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aoscompose-linux-arm64"
        sha256 "a770bbee14b3d8bf7a8e51e138d40c07a8ccd8068163d640f18508af15a0efd6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aosward-linux-arm64"
        sha256 "a770bbee14b3d8bf7a8e51e138d40c07a8ccd8068163d640f18508af15a0efd6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aosguard-linux-arm64"
        sha256 "14a52b7d7fc8dd341594191f9ec098ad16fde220e7488aaca724798d5cc37a3e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.335.0/aterm-linux-arm64"
        sha256 "c2a7c71e54eacd719e5dd00a04f32880dfd93dd3419a7d397976b4e856a6b6a0"
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
