class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.386.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aos-darwin-arm64"
      sha256 "a0d6076dbc9c698ec59011341d5e3772afec8bf27f3b8857e2fe58dd368f5420"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aoscompose-darwin-arm64"
        sha256 "a0d6076dbc9c698ec59011341d5e3772afec8bf27f3b8857e2fe58dd368f5420"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aosward-darwin-arm64"
        sha256 "a0d6076dbc9c698ec59011341d5e3772afec8bf27f3b8857e2fe58dd368f5420"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aosguard-darwin-arm64"
        sha256 "3c2e10952d9cefead294a77e8957e90179cfd36a236c480293d425df5abb1224"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aterm-darwin-arm64"
        sha256 "3115e51c91ff0ba10e57d02ee9fefdbe78059d1a8595448fe13b6a9ea936612a"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aos-linux-amd64"
      sha256 "1eb3f009ef12d57944f1c5ed87a14e104b025d55d14d5cda2c81a5b9435efafb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aoscompose-linux-amd64"
        sha256 "1eb3f009ef12d57944f1c5ed87a14e104b025d55d14d5cda2c81a5b9435efafb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aosward-linux-amd64"
        sha256 "1eb3f009ef12d57944f1c5ed87a14e104b025d55d14d5cda2c81a5b9435efafb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aosguard-linux-amd64"
        sha256 "e2dd1800ee2b82dc7d82637a978fe92465526589dcc30c91ba703164c1419835"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aterm-linux-amd64"
        sha256 "b156042cc66e4073f88b54f3739ccdb956d604eb64f1272e39bc775809e4e776"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aos-linux-arm64"
      sha256 "f511f67af1bd0346c2e36e89071983b803c9c12d9ae91f1f53c2a893edd942d2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aoscompose-linux-arm64"
        sha256 "f511f67af1bd0346c2e36e89071983b803c9c12d9ae91f1f53c2a893edd942d2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aosward-linux-arm64"
        sha256 "f511f67af1bd0346c2e36e89071983b803c9c12d9ae91f1f53c2a893edd942d2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aosguard-linux-arm64"
        sha256 "aeb094a6d6b49dcba43ce2a2a82b2a9effedcc94ddb6006ec73758062eb6711e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.386.0/aterm-linux-arm64"
        sha256 "688c555fdeab84e94f26872b0d9ee77bd2a9c783edeb08ff0eab7244b872d643"
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
