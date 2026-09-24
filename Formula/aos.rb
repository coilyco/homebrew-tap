class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.357.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aos-darwin-arm64"
      sha256 "eb6afe1c0ba6bf2bbe81858b9eb55e550cc425ac5604ae36f88f5522b7f65a8d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aoscompose-darwin-arm64"
        sha256 "eb6afe1c0ba6bf2bbe81858b9eb55e550cc425ac5604ae36f88f5522b7f65a8d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aosward-darwin-arm64"
        sha256 "eb6afe1c0ba6bf2bbe81858b9eb55e550cc425ac5604ae36f88f5522b7f65a8d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aosguard-darwin-arm64"
        sha256 "ba4b35a63a35431a1c5aebaebdc77787f2d0c9cc114bac83877c5b99654d98fa"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aterm-darwin-arm64"
        sha256 "40f440d64c96208b0c93fce106e4fc6b9708562640e14992478c8c55af03a2a2"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aos-linux-amd64"
      sha256 "5a0378f97657b574650447bb3b68f1b4aadcd666ccaedb9d09b425da1369747a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aoscompose-linux-amd64"
        sha256 "5a0378f97657b574650447bb3b68f1b4aadcd666ccaedb9d09b425da1369747a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aosward-linux-amd64"
        sha256 "5a0378f97657b574650447bb3b68f1b4aadcd666ccaedb9d09b425da1369747a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aosguard-linux-amd64"
        sha256 "287a98a070644eade787ef49b828b7f95059733963cb413e6a4fa8cf2813dbfb"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aterm-linux-amd64"
        sha256 "9180be114c1d144705c0692a6dbc00e0a397395d0aff90faf4f866bb2e5b9932"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aos-linux-arm64"
      sha256 "dcf2496f8318aef882eda0eee14daa609e8fe3c91d477daee279945f05d54d1a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aoscompose-linux-arm64"
        sha256 "dcf2496f8318aef882eda0eee14daa609e8fe3c91d477daee279945f05d54d1a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aosward-linux-arm64"
        sha256 "dcf2496f8318aef882eda0eee14daa609e8fe3c91d477daee279945f05d54d1a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aosguard-linux-arm64"
        sha256 "8c7fd9216105f158d0d37b9cbdb305121798ab8baf49044269faebc892b0171c"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.357.0/aterm-linux-arm64"
        sha256 "a874ec99daaec822bf4d68bc1047e66f3ebb8327bccc82a088db6ab9a3cf77f4"
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
