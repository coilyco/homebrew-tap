class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.436.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aos-darwin-arm64"
      sha256 "526a89fe8fc8e503e512c05e28fbc25b85d9eb7f32f861e21a85439f33000329"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aoscompose-darwin-arm64"
        sha256 "526a89fe8fc8e503e512c05e28fbc25b85d9eb7f32f861e21a85439f33000329"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aosward-darwin-arm64"
        sha256 "526a89fe8fc8e503e512c05e28fbc25b85d9eb7f32f861e21a85439f33000329"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aosguard-darwin-arm64"
        sha256 "650a9f4bd4205229ee1f268c8f93bb20e91e6607b5b17e01eeacb151e28c277b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aterm-darwin-arm64"
        sha256 "4ac65ca0ca1cdb10592a1decc726bbd65cf1a9f98b2c2eaf910bcb8c6f127072"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aos-linux-amd64"
      sha256 "a3ddef4de23b64fdfe7256f23e02b78696c689a5c986ea058b706af537cc6082"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aoscompose-linux-amd64"
        sha256 "a3ddef4de23b64fdfe7256f23e02b78696c689a5c986ea058b706af537cc6082"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aosward-linux-amd64"
        sha256 "a3ddef4de23b64fdfe7256f23e02b78696c689a5c986ea058b706af537cc6082"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aosguard-linux-amd64"
        sha256 "c5e23fcbb4cfd4436e30bf02730fef353a2bf2e75158813a2cb2f05dab2bdee4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aterm-linux-amd64"
        sha256 "3110fb7090e8ea897ea2b8885d0844aa75ac1f9dbbba096736164825cf849fa4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aos-linux-arm64"
      sha256 "1557e35eabc18d069d05dacbe113e5a30ff11c549aec15409f0eb7d176c6847d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aoscompose-linux-arm64"
        sha256 "1557e35eabc18d069d05dacbe113e5a30ff11c549aec15409f0eb7d176c6847d"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aosward-linux-arm64"
        sha256 "1557e35eabc18d069d05dacbe113e5a30ff11c549aec15409f0eb7d176c6847d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aosguard-linux-arm64"
        sha256 "4dd805eacdbda2ab6ba402e630231b9d622241cc243d547884a3c7b90710aac0"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.436.0/aterm-linux-arm64"
        sha256 "52d8aec69a14f995572d1afc7be7ce8c9ba68eb982e8e58cd8e6556c1b16f69c"
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
