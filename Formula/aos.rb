class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.398.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aos-darwin-arm64"
      sha256 "55e464cdfffbb0ab0b5299d646493b013adcf8b061c666e02a88d71e203f04fd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aoscompose-darwin-arm64"
        sha256 "55e464cdfffbb0ab0b5299d646493b013adcf8b061c666e02a88d71e203f04fd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aosward-darwin-arm64"
        sha256 "55e464cdfffbb0ab0b5299d646493b013adcf8b061c666e02a88d71e203f04fd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aosguard-darwin-arm64"
        sha256 "282e0e7beb1e8870d2056fde1d7c925a1d35c8a58660e4ece05cb5e5a34915f1"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aterm-darwin-arm64"
        sha256 "da2097f852f7af2b6a54562506d8ef8c18f10db2bdc979b1bc92355bcc241268"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aos-linux-amd64"
      sha256 "cce2b16a396bc98069b5230daf08629b18ca77c3b95ccb5f790e8e912afd12de"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aoscompose-linux-amd64"
        sha256 "cce2b16a396bc98069b5230daf08629b18ca77c3b95ccb5f790e8e912afd12de"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aosward-linux-amd64"
        sha256 "cce2b16a396bc98069b5230daf08629b18ca77c3b95ccb5f790e8e912afd12de"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aosguard-linux-amd64"
        sha256 "67c9c83cfce59de967b78e198bac906911c860c8330332927ea1c52e58255077"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aterm-linux-amd64"
        sha256 "384c8124e665c702d5bd5b05fb76d6a7d491d45e21e664ba3350dc59ef7d09fc"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aos-linux-arm64"
      sha256 "08f66877528aa050e2f622677133dd29d9b509548efde8ac87828611a9587ab4"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aoscompose-linux-arm64"
        sha256 "08f66877528aa050e2f622677133dd29d9b509548efde8ac87828611a9587ab4"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aosward-linux-arm64"
        sha256 "08f66877528aa050e2f622677133dd29d9b509548efde8ac87828611a9587ab4"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aosguard-linux-arm64"
        sha256 "64975f11a2e1c1f5a015d7658c2c493852e74090904e83847d4247ef885d93f9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.398.0/aterm-linux-arm64"
        sha256 "e1cfe7f7e98dd5840daff18b9da45943815acdf58cfb2949735c526676f78c0f"
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
