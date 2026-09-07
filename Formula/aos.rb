class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.311.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aos-darwin-arm64"
      sha256 "53aba5b88c782def89fd9bd1e19c2decb61487e358827110259dbed1f16a3ebf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aoscompose-darwin-arm64"
        sha256 "53aba5b88c782def89fd9bd1e19c2decb61487e358827110259dbed1f16a3ebf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aosward-darwin-arm64"
        sha256 "53aba5b88c782def89fd9bd1e19c2decb61487e358827110259dbed1f16a3ebf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aosguard-darwin-arm64"
        sha256 "c7d81ebb8d6b855f8814659ff5d6539bfefa8ac9b41f5527407f07deb518d9f3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aterm-darwin-arm64"
        sha256 "0013c36ecfa88f80cb68bbfb677674fb9726278578fa518adc5be416e2794e15"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aos-linux-amd64"
      sha256 "6a0028ce025b4f95ee8872e094ef1c73bf8c96c0e366e40984a7da740adac8fe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aoscompose-linux-amd64"
        sha256 "6a0028ce025b4f95ee8872e094ef1c73bf8c96c0e366e40984a7da740adac8fe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aosward-linux-amd64"
        sha256 "6a0028ce025b4f95ee8872e094ef1c73bf8c96c0e366e40984a7da740adac8fe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aosguard-linux-amd64"
        sha256 "5ba19013cdee1509285c79b6f1e6b0e8a35f1a98de953b27760f74ce27a71fa3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aterm-linux-amd64"
        sha256 "a34e30a3bf6a09a85d77f4975356a66245052c3a4afda338d8d5877119a0d602"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aos-linux-arm64"
      sha256 "a5d60e25581c5b01e9e280d4ea6f780db2771384fcc3e504330ebe0711af5ad5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aoscompose-linux-arm64"
        sha256 "a5d60e25581c5b01e9e280d4ea6f780db2771384fcc3e504330ebe0711af5ad5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aosward-linux-arm64"
        sha256 "a5d60e25581c5b01e9e280d4ea6f780db2771384fcc3e504330ebe0711af5ad5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aosguard-linux-arm64"
        sha256 "4e590d09fce9dd782760577076c1e1a9623e11e5bcc533ef2898852cd1360374"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.311.0/aterm-linux-arm64"
        sha256 "a18823d0a944ad1ffd195ccc50f54462560429b534d9a4722175a5f6c73f4501"
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
