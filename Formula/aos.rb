class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.273.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aos-darwin-arm64"
      sha256 "71dc02359422c8f9f9a26470595cec6f30027fbccd32ed5135ff164d3731b9ca"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aoscompose-darwin-arm64"
        sha256 "71dc02359422c8f9f9a26470595cec6f30027fbccd32ed5135ff164d3731b9ca"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aosward-darwin-arm64"
        sha256 "71dc02359422c8f9f9a26470595cec6f30027fbccd32ed5135ff164d3731b9ca"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aosguard-darwin-arm64"
        sha256 "9ce7703c33e57c18fdcea69c2c1c08c36ea5be392388e4041707b9b7c83c90b5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aterm-darwin-arm64"
        sha256 "2cb3dfe96189ac633fce35b1171783de0695cef6e4ed3f4edcd8e1c02212a6a7"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aos-linux-amd64"
      sha256 "8a9a05c20d06a92e5b65277e433b56edb3b2e4bbb7cd207c10ccf890f219c10c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aoscompose-linux-amd64"
        sha256 "8a9a05c20d06a92e5b65277e433b56edb3b2e4bbb7cd207c10ccf890f219c10c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aosward-linux-amd64"
        sha256 "8a9a05c20d06a92e5b65277e433b56edb3b2e4bbb7cd207c10ccf890f219c10c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aosguard-linux-amd64"
        sha256 "014f5d0cb0a6cd97b55ff9dd3cceed6ad2c3cb1f7f1485d51d3a4e6d054b889a"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aterm-linux-amd64"
        sha256 "810e90bd13a805f20699c0d5a5643ec1d0bd82738cea69c8cdbe6c87b46f2492"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aos-linux-arm64"
      sha256 "58c64f8fe373e12a3d54a7f7dc8a6fb4ff8931c15602b0c4faa34f2f0b529972"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aoscompose-linux-arm64"
        sha256 "58c64f8fe373e12a3d54a7f7dc8a6fb4ff8931c15602b0c4faa34f2f0b529972"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aosward-linux-arm64"
        sha256 "58c64f8fe373e12a3d54a7f7dc8a6fb4ff8931c15602b0c4faa34f2f0b529972"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aosguard-linux-arm64"
        sha256 "42b6713c8cc6b498c03fa859f3066f2b75e0ec101ff0784674e690807a1e4638"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.273.0/aterm-linux-arm64"
        sha256 "6a90ca461beba8dce3b668fd56de22fd25ab59ec7da03aa6736336a18a8691fd"
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
