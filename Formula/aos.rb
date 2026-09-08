class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.315.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aos-darwin-arm64"
      sha256 "dc857e15b8b3725e4454c293a61c0cb9a8b897e908925aecf1543beda5509a4c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aoscompose-darwin-arm64"
        sha256 "dc857e15b8b3725e4454c293a61c0cb9a8b897e908925aecf1543beda5509a4c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aosward-darwin-arm64"
        sha256 "dc857e15b8b3725e4454c293a61c0cb9a8b897e908925aecf1543beda5509a4c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aosguard-darwin-arm64"
        sha256 "f0b39c6ea226f2b216be91091885710ae280304f99ced59830ea411e7d27ef5f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aterm-darwin-arm64"
        sha256 "d91e319c43b133135ee7659631568def913d02e39034cf16d583d78389df845c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aos-linux-amd64"
      sha256 "970c6d219365739b70c30a784a223972556fd3828abeb9a01d34f6bc6902ae3c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aoscompose-linux-amd64"
        sha256 "970c6d219365739b70c30a784a223972556fd3828abeb9a01d34f6bc6902ae3c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aosward-linux-amd64"
        sha256 "970c6d219365739b70c30a784a223972556fd3828abeb9a01d34f6bc6902ae3c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aosguard-linux-amd64"
        sha256 "aa2bb5060f8527f919bc0b9561551a2d50e08a4ac3257227932f5a7b003a8ffe"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aterm-linux-amd64"
        sha256 "9214897789d89ee43cb1e4889d46cef72ff2631b139d71d74b128bde32939343"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aos-linux-arm64"
      sha256 "036be9f6385f7123d2e00ff2109c367ecc97a01e4f8bd10fc68f3c2b363d1de9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aoscompose-linux-arm64"
        sha256 "036be9f6385f7123d2e00ff2109c367ecc97a01e4f8bd10fc68f3c2b363d1de9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aosward-linux-arm64"
        sha256 "036be9f6385f7123d2e00ff2109c367ecc97a01e4f8bd10fc68f3c2b363d1de9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aosguard-linux-arm64"
        sha256 "c165d579b44e259c724044af1bc6841caa948cab50f1d0174b0fd2d754446e28"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.315.0/aterm-linux-arm64"
        sha256 "c27c931d7888cd8c39f00f63a9b38c37f7fd94c95ea9a8bd7fca3b218eecc37e"
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
