class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.285.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aos-darwin-arm64"
      sha256 "04dcc4024c9003c90083621924efe16d3414b200040539da083ba0591a1dfde8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aoscompose-darwin-arm64"
        sha256 "04dcc4024c9003c90083621924efe16d3414b200040539da083ba0591a1dfde8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aosward-darwin-arm64"
        sha256 "04dcc4024c9003c90083621924efe16d3414b200040539da083ba0591a1dfde8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aosguard-darwin-arm64"
        sha256 "c629e35e876bda2853e0a7d740b10abd7d5ca258a67019d670e7fcd16346cd54"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aterm-darwin-arm64"
        sha256 "be49ba45113f0e7dbae088e6480f7df78e0395e679aaedd877ca599e704776d5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aos-linux-amd64"
      sha256 "0128cddcf42c918cf168f78c9a80bc93bfb9a107f6ee8d609f4afc807cf10603"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aoscompose-linux-amd64"
        sha256 "0128cddcf42c918cf168f78c9a80bc93bfb9a107f6ee8d609f4afc807cf10603"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aosward-linux-amd64"
        sha256 "0128cddcf42c918cf168f78c9a80bc93bfb9a107f6ee8d609f4afc807cf10603"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aosguard-linux-amd64"
        sha256 "4aac732d5ccfe018ff5c33722d1b7bacdd1307deb7e495e6a9ea69382eb337f5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aterm-linux-amd64"
        sha256 "74ebcbff52a94f9bf55633d734d1c9e809b8368cf19557e0becd5d0588cda48c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aos-linux-arm64"
      sha256 "d469926a5200fd88c90411ced8c59f64eb711096626ff313720dc66c2ebf686d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aoscompose-linux-arm64"
        sha256 "d469926a5200fd88c90411ced8c59f64eb711096626ff313720dc66c2ebf686d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aosward-linux-arm64"
        sha256 "d469926a5200fd88c90411ced8c59f64eb711096626ff313720dc66c2ebf686d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aosguard-linux-arm64"
        sha256 "4a0c6271e73a83a4f15cf88b83f780df34ce2d3cbc42ba2e3839d33337c7aa92"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.285.0/aterm-linux-arm64"
        sha256 "565c3ea1fde59ddc0459b32af19b059d6e8a40466ed7be579918d39bd869ee43"
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
