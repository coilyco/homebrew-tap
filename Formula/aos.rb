class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.344.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aos-darwin-arm64"
      sha256 "85bc473e1dcfb9491d387bc3a784610a620845791b3dfd04efe6143b181892a3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aoscompose-darwin-arm64"
        sha256 "85bc473e1dcfb9491d387bc3a784610a620845791b3dfd04efe6143b181892a3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aosward-darwin-arm64"
        sha256 "85bc473e1dcfb9491d387bc3a784610a620845791b3dfd04efe6143b181892a3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aosguard-darwin-arm64"
        sha256 "2504a58aaa16ead8da582f98a34fd77164150014c37566a955494afeebfcfa46"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aterm-darwin-arm64"
        sha256 "b2a8b0e45edb1c25a1c68007664c37a3087fb86e660df84a0efe8415545abb08"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aos-linux-amd64"
      sha256 "40b11ca9581c5f60dcf6b031966d91a86dc777241f02d1b25f2fca12eb998f0f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aoscompose-linux-amd64"
        sha256 "40b11ca9581c5f60dcf6b031966d91a86dc777241f02d1b25f2fca12eb998f0f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aosward-linux-amd64"
        sha256 "40b11ca9581c5f60dcf6b031966d91a86dc777241f02d1b25f2fca12eb998f0f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aosguard-linux-amd64"
        sha256 "4c19c12d227818b2b6fce17e436c2a9d61beda4dfb1654ef0566382e09aec9b0"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aterm-linux-amd64"
        sha256 "8e13a4a0fefc980715d4819aad663799c1657a092f7e2bfe1c859fc62f2f585a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aos-linux-arm64"
      sha256 "4ef3129acc4d005b879a5b72953a875de7e50860632ff318f2378b21e8e2d7c6"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aoscompose-linux-arm64"
        sha256 "4ef3129acc4d005b879a5b72953a875de7e50860632ff318f2378b21e8e2d7c6"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aosward-linux-arm64"
        sha256 "4ef3129acc4d005b879a5b72953a875de7e50860632ff318f2378b21e8e2d7c6"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aosguard-linux-arm64"
        sha256 "538119ec87d1f883e2d2d40b7620dac32915b94726ad04d90b88b78cc9338d31"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.344.0/aterm-linux-arm64"
        sha256 "069fb1cea18aa967916f8dfbcf675baf784f8ab1e60c90f5a6dca0d99af0aae2"
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
