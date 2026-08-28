class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.259.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aos-darwin-arm64"
      sha256 "b1735684326889f075bb98e1287081ba5092fcb5fda33e4a8a1474d282ce1541"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aoscompose-darwin-arm64"
        sha256 "b1735684326889f075bb98e1287081ba5092fcb5fda33e4a8a1474d282ce1541"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aosward-darwin-arm64"
        sha256 "b1735684326889f075bb98e1287081ba5092fcb5fda33e4a8a1474d282ce1541"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aosguard-darwin-arm64"
        sha256 "ce7c3add0f886e7b8ba374be002cd90cc1ba8cd7fca5806f3cc9aeeffe5432c8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aterm-darwin-arm64"
        sha256 "0ea0f7c32636e15b08104a652cbd6111a6510fbdb22fa00bfeada70916ed38fb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aos-linux-amd64"
      sha256 "cbebed4a5f5028857bef854b8e75b4f4fb22b1f03e4d181c286c25ae6c170274"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aoscompose-linux-amd64"
        sha256 "cbebed4a5f5028857bef854b8e75b4f4fb22b1f03e4d181c286c25ae6c170274"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aosward-linux-amd64"
        sha256 "cbebed4a5f5028857bef854b8e75b4f4fb22b1f03e4d181c286c25ae6c170274"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aosguard-linux-amd64"
        sha256 "67ea25191f8ba15da520998e1e0534bca59b660fa12a8edf09efbdfe1b04d649"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aterm-linux-amd64"
        sha256 "c2e017f88c61b0ae2db680d8409511174824cc5ad19520d344060798db4cd462"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aos-linux-arm64"
      sha256 "976bbb5520a239de0dfe1d50db2cfbb07d984444f859624b5ee9f445277b2392"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aoscompose-linux-arm64"
        sha256 "976bbb5520a239de0dfe1d50db2cfbb07d984444f859624b5ee9f445277b2392"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aosward-linux-arm64"
        sha256 "976bbb5520a239de0dfe1d50db2cfbb07d984444f859624b5ee9f445277b2392"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aosguard-linux-arm64"
        sha256 "f9506ab581aaf164689df3ed977bcc819c82573406d78aa7bc6d01d105a88b45"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.259.0/aterm-linux-arm64"
        sha256 "1e56ec1ab66dfd1f7ffc8d451f1f1c295df31446a6f14c54e84f2f6645102fa3"
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
