class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.264.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aos-darwin-arm64"
      sha256 "e033e8eb8fc9b8f4d5397ef56681f1253e1c67b8e811152f4e271bc3bd44be51"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aoscompose-darwin-arm64"
        sha256 "e033e8eb8fc9b8f4d5397ef56681f1253e1c67b8e811152f4e271bc3bd44be51"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aosward-darwin-arm64"
        sha256 "e033e8eb8fc9b8f4d5397ef56681f1253e1c67b8e811152f4e271bc3bd44be51"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aosguard-darwin-arm64"
        sha256 "a1e8faec63196a6957bb40b9a5c767ec449b4bf793b3a670d97b14dccb12bc58"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aterm-darwin-arm64"
        sha256 "cd82dc106f4465a92561b17386427c850bccb4ca3930405bdf1b94513cf870b9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aos-linux-amd64"
      sha256 "78070430d378a352a7fa23a8b69c4c5567f46fae8b99f9426b794a0862321ea3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aoscompose-linux-amd64"
        sha256 "78070430d378a352a7fa23a8b69c4c5567f46fae8b99f9426b794a0862321ea3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aosward-linux-amd64"
        sha256 "78070430d378a352a7fa23a8b69c4c5567f46fae8b99f9426b794a0862321ea3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aosguard-linux-amd64"
        sha256 "2f409e4c2f249e3ff69edc9c1f19c369415a1e2363abe7a13260dd3190e4537f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aterm-linux-amd64"
        sha256 "fd844c8a632e13daa31ef75c7f98f7579916c951a64b22a5c58a6eec77fb0de2"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aos-linux-arm64"
      sha256 "22ce4acb684319cd4bd0fb5f29dc4707c2e7966e845c3dc5cd4491723fdce777"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aoscompose-linux-arm64"
        sha256 "22ce4acb684319cd4bd0fb5f29dc4707c2e7966e845c3dc5cd4491723fdce777"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aosward-linux-arm64"
        sha256 "22ce4acb684319cd4bd0fb5f29dc4707c2e7966e845c3dc5cd4491723fdce777"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aosguard-linux-arm64"
        sha256 "af3d3d396c2c447c37f31c2dd8961398bbaa4195896cbfea4e7ec212ad17e6b7"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.264.0/aterm-linux-arm64"
        sha256 "f2a6619aa47c1c985146c38b4aa2cad1844577fa1bcccbee22fc37d086c5b63d"
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
