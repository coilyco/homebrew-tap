class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.269.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aos-darwin-arm64"
      sha256 "d37c2f722fd869dbe90e0fac38fe916b2492a9d854713d06cf4bf8fd55a580e5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aoscompose-darwin-arm64"
        sha256 "d37c2f722fd869dbe90e0fac38fe916b2492a9d854713d06cf4bf8fd55a580e5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aosward-darwin-arm64"
        sha256 "d37c2f722fd869dbe90e0fac38fe916b2492a9d854713d06cf4bf8fd55a580e5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aosguard-darwin-arm64"
        sha256 "1d4d399f290f12e21e1886c5cf12fd519c6b1a90e7f2285ddff38ea11b37cbd9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aterm-darwin-arm64"
        sha256 "a75f78e18e544f1822ddc89ade775098d995bc00e96c0104d1405ee42793c154"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aos-linux-amd64"
      sha256 "12f95ba35cb412c018da64a69deb53fd53abad3f2cb35db766ff47e060272176"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aoscompose-linux-amd64"
        sha256 "12f95ba35cb412c018da64a69deb53fd53abad3f2cb35db766ff47e060272176"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aosward-linux-amd64"
        sha256 "12f95ba35cb412c018da64a69deb53fd53abad3f2cb35db766ff47e060272176"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aosguard-linux-amd64"
        sha256 "7abd5e92a6d06b204954e4424dab57ff99ba665f2f44ba5c817b24197d5224bc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aterm-linux-amd64"
        sha256 "9af060b6759ce0686644b46de4491a3e2874884c42fd8258374fc393feec32e2"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aos-linux-arm64"
      sha256 "8deaa66ac0dd38f17f34d077e84ecbfbd21be231b44c13ec58740b5bb5c4f393"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aoscompose-linux-arm64"
        sha256 "8deaa66ac0dd38f17f34d077e84ecbfbd21be231b44c13ec58740b5bb5c4f393"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aosward-linux-arm64"
        sha256 "8deaa66ac0dd38f17f34d077e84ecbfbd21be231b44c13ec58740b5bb5c4f393"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aosguard-linux-arm64"
        sha256 "d31bc67a88be8a8c92b26af0095a6420c6d41befe4e80e7fce17e77ebdaeb860"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.269.0/aterm-linux-arm64"
        sha256 "426dcc01e9a37803b6c67b8afd54d066d2b78a74f52df175922c38d17caf80ad"
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
