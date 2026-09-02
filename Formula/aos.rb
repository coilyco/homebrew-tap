class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.295.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aos-darwin-arm64"
      sha256 "e51f0c769b3088257e2f27fac5e0bf111d0173f3566a94c202123abf85a52275"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aoscompose-darwin-arm64"
        sha256 "e51f0c769b3088257e2f27fac5e0bf111d0173f3566a94c202123abf85a52275"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aosward-darwin-arm64"
        sha256 "e51f0c769b3088257e2f27fac5e0bf111d0173f3566a94c202123abf85a52275"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aosguard-darwin-arm64"
        sha256 "9de0488ea0c5f3b86c2bb6136d4fc72e7b54f362e7aff66e3733fb62c6b90ac2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aterm-darwin-arm64"
        sha256 "fdb013fee18031359a85bdd0267da9acffa8bcf0a681410bc7f731d7b5d4ca1b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aos-linux-amd64"
      sha256 "5bec43a5320bec18f0d74b86f10afb06a843ef3a0b58e7ca2e48640cb3af6db5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aoscompose-linux-amd64"
        sha256 "5bec43a5320bec18f0d74b86f10afb06a843ef3a0b58e7ca2e48640cb3af6db5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aosward-linux-amd64"
        sha256 "5bec43a5320bec18f0d74b86f10afb06a843ef3a0b58e7ca2e48640cb3af6db5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aosguard-linux-amd64"
        sha256 "f60ec7358c4042822a1fdee61b8d3cc03e9294004042071410531839ed91bbb9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aterm-linux-amd64"
        sha256 "1939fd8618afe544a6180d05a384a80d88e3d4f1c4fbb60cac1f8478e400d85e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aos-linux-arm64"
      sha256 "6c5b08eecf56c41485dd225b1eed88657a9bd9fe4b5d06998440a930ac145db8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aoscompose-linux-arm64"
        sha256 "6c5b08eecf56c41485dd225b1eed88657a9bd9fe4b5d06998440a930ac145db8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aosward-linux-arm64"
        sha256 "6c5b08eecf56c41485dd225b1eed88657a9bd9fe4b5d06998440a930ac145db8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aosguard-linux-arm64"
        sha256 "03780f9a34b702047c9c88cb712e4c288dfadfe3e7f35d1809a329cf59c6416e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.295.0/aterm-linux-arm64"
        sha256 "51624e2720779d1dc627fc5615410314c94d61ac12125dd5f6d3cb9b92616a9a"
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
