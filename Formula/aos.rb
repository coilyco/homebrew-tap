class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.250.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aos-darwin-arm64"
      sha256 "eb08f97dd87e6d15d29c096ffc1d16058b2c97ab3910abf1de70c22d430e6554"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aoscompose-darwin-arm64"
        sha256 "eb08f97dd87e6d15d29c096ffc1d16058b2c97ab3910abf1de70c22d430e6554"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aosward-darwin-arm64"
        sha256 "eb08f97dd87e6d15d29c096ffc1d16058b2c97ab3910abf1de70c22d430e6554"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aosguard-darwin-arm64"
        sha256 "26317d8d0e69524692081e25e35683e3336437c52662f417f98879b7edf68099"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aterm-darwin-arm64"
        sha256 "3f463523faac45f88b3ce55dbfe7ab6f3e78739aadff4a95fce9422b80101173"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aos-linux-amd64"
      sha256 "7212c6c38bee312af8c612aefe4b93f2eddcfd5b773d4d2faf2459c923fa5c90"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aoscompose-linux-amd64"
        sha256 "7212c6c38bee312af8c612aefe4b93f2eddcfd5b773d4d2faf2459c923fa5c90"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aosward-linux-amd64"
        sha256 "7212c6c38bee312af8c612aefe4b93f2eddcfd5b773d4d2faf2459c923fa5c90"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aosguard-linux-amd64"
        sha256 "e5cab56abc8ff14ddea9d0a056fa356e2800ae799b2245947b80bcf3c031fe00"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aterm-linux-amd64"
        sha256 "c156c0517d453c56f56d01122509445cd3a39908a9a9b606c788d1530eba9d59"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aos-linux-arm64"
      sha256 "e42456b01216f8615fde20e5501d59fc23f307313bfef7d537f68736f3d9a29c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aoscompose-linux-arm64"
        sha256 "e42456b01216f8615fde20e5501d59fc23f307313bfef7d537f68736f3d9a29c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aosward-linux-arm64"
        sha256 "e42456b01216f8615fde20e5501d59fc23f307313bfef7d537f68736f3d9a29c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aosguard-linux-arm64"
        sha256 "5808d97f003e8482d3d49086178a3d7796ad6f471d1b138ad03f84c98b1cc92f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.250.0/aterm-linux-arm64"
        sha256 "f407f926016212fa5f2e5e1db92ddaf1dfe2414ea28d38eda33fea2a2232e596"
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
