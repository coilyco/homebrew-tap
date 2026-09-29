class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.401.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aos-darwin-arm64"
      sha256 "946453ae2557d98c609be3d70d68c1439f264df29e9bdcac95cc648209f86eec"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aoscompose-darwin-arm64"
        sha256 "946453ae2557d98c609be3d70d68c1439f264df29e9bdcac95cc648209f86eec"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aosward-darwin-arm64"
        sha256 "946453ae2557d98c609be3d70d68c1439f264df29e9bdcac95cc648209f86eec"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aosguard-darwin-arm64"
        sha256 "08efdeb2ce52855f53c723cf374779d726ec07fb2b955ea9c60c80f1d5d2783e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aterm-darwin-arm64"
        sha256 "626846a4e1511825e7fbe944643bf8f8e60e29a90b7627c607cb007e14369819"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aos-linux-amd64"
      sha256 "535408e81bcba011f700843f0c212b70ade939c649606c2d73b979c62ec7ede7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aoscompose-linux-amd64"
        sha256 "535408e81bcba011f700843f0c212b70ade939c649606c2d73b979c62ec7ede7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aosward-linux-amd64"
        sha256 "535408e81bcba011f700843f0c212b70ade939c649606c2d73b979c62ec7ede7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aosguard-linux-amd64"
        sha256 "d866e738cf2fed40b9e9cbe3eeec0595ac71390ba96a28763625456eb4275d00"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aterm-linux-amd64"
        sha256 "738028ee928b593a81698b0912d4d6b9c0638e0922db5e3780d72b3d02b17d71"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aos-linux-arm64"
      sha256 "b17c42caf8e370bf5b6cdec238e79a4ae28698ad66ddb312c1fc241821751974"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aoscompose-linux-arm64"
        sha256 "b17c42caf8e370bf5b6cdec238e79a4ae28698ad66ddb312c1fc241821751974"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aosward-linux-arm64"
        sha256 "b17c42caf8e370bf5b6cdec238e79a4ae28698ad66ddb312c1fc241821751974"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aosguard-linux-arm64"
        sha256 "1eee2e79d6f1699ff899554c231e45925c0bb6740ebcf08e6ebb5a3445bf5e62"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.401.0/aterm-linux-arm64"
        sha256 "efdd8840ecd362660af5e9ebe2731c40025f8ad1d194b5189616019cb32887b1"
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
