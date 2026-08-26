class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.242.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aos-darwin-arm64"
      sha256 "1aff982ff6fd7b2e7acbb0dcc8bafd5258725332f76ff7adaf6022369e643332"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aoscompose-darwin-arm64"
        sha256 "1aff982ff6fd7b2e7acbb0dcc8bafd5258725332f76ff7adaf6022369e643332"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aosward-darwin-arm64"
        sha256 "1aff982ff6fd7b2e7acbb0dcc8bafd5258725332f76ff7adaf6022369e643332"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aosguard-darwin-arm64"
        sha256 "df98f7f2e4be6174ee809a793d37cfee56c68f66a78e1f36fe2708930e94e347"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aterm-darwin-arm64"
        sha256 "e5d8e8f6b8f82195497805c886416addf33e6e1c9a879ff39bd438771745267a"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aos-linux-amd64"
      sha256 "7678cc405b82807025ffff87f85fc437b23f1716683ae7c01708fd1e2a7d6ac2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aoscompose-linux-amd64"
        sha256 "7678cc405b82807025ffff87f85fc437b23f1716683ae7c01708fd1e2a7d6ac2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aosward-linux-amd64"
        sha256 "7678cc405b82807025ffff87f85fc437b23f1716683ae7c01708fd1e2a7d6ac2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aosguard-linux-amd64"
        sha256 "35364df9468256fa04c1c49950bcb441fbf61619d4a4c301653010f3ad4ca1d6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aterm-linux-amd64"
        sha256 "d059d909f742665133020316edc92a9327b63f9f7e9040ca9e4c5c2b431d71b1"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aos-linux-arm64"
      sha256 "28a3bf19110d16d623db3a1bd429b57ac59782a25502e24b679da3d6f85dcc02"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aoscompose-linux-arm64"
        sha256 "28a3bf19110d16d623db3a1bd429b57ac59782a25502e24b679da3d6f85dcc02"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aosward-linux-arm64"
        sha256 "28a3bf19110d16d623db3a1bd429b57ac59782a25502e24b679da3d6f85dcc02"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aosguard-linux-arm64"
        sha256 "0c39b159157dd6dad062dda4292382c996f8029a2d668a31bc22ab4196115453"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.242.0/aterm-linux-arm64"
        sha256 "a84fe271bd1a9b4981a51e2b1da26111588e4cdb54c4a645aa9066b4450b8384"
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
