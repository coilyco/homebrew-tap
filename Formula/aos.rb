class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.219.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aos-darwin-arm64"
      sha256 "92a7c94ca6d7d54b14bc28ef85748c476fb74fc5e7ce50b679f4a089742bea43"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aoscompose-darwin-arm64"
        sha256 "92a7c94ca6d7d54b14bc28ef85748c476fb74fc5e7ce50b679f4a089742bea43"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosward-darwin-arm64"
        sha256 "92a7c94ca6d7d54b14bc28ef85748c476fb74fc5e7ce50b679f4a089742bea43"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosguard-darwin-arm64"
        sha256 "fd80d1b1015a765093f31c4b896e9f290da92f89b28f98ee6c428909a5e5a766"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/agent-terminal-darwin-arm64"
        sha256 "8b67b354e32b2e9ffb6d752406f9e0b68dc704125e93e14d9ee47edd37c75d0a"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosterm-darwin-arm64"
        sha256 "8b67b354e32b2e9ffb6d752406f9e0b68dc704125e93e14d9ee47edd37c75d0a"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aos-linux-amd64"
      sha256 "51059dfb995924c12499e0809dbbea94baf73f664219b090f01db66596860bef"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aoscompose-linux-amd64"
        sha256 "51059dfb995924c12499e0809dbbea94baf73f664219b090f01db66596860bef"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosward-linux-amd64"
        sha256 "51059dfb995924c12499e0809dbbea94baf73f664219b090f01db66596860bef"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosguard-linux-amd64"
        sha256 "8b7d8a2d777383d671e19774b5699413030782185f2a00aeb26b3c1984c27ce0"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/agent-terminal-linux-amd64"
        sha256 "4b8cc02e87a449b7c34bc048d323b5926e9839943eb2d4a1693c3ba7c20d9ec6"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosterm-linux-amd64"
        sha256 "4b8cc02e87a449b7c34bc048d323b5926e9839943eb2d4a1693c3ba7c20d9ec6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aos-linux-arm64"
      sha256 "d81a14723612596791d7c4f0ef4c93bd742d08be7317bff0f8ef37a6b77be2b7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aoscompose-linux-arm64"
        sha256 "d81a14723612596791d7c4f0ef4c93bd742d08be7317bff0f8ef37a6b77be2b7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosward-linux-arm64"
        sha256 "d81a14723612596791d7c4f0ef4c93bd742d08be7317bff0f8ef37a6b77be2b7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosguard-linux-arm64"
        sha256 "aefc48b24bbd92627494f4086d575d26b93bcd835cb999539b61215884b7cc39"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/agent-terminal-linux-arm64"
        sha256 "6e9e574bd89e6ec227722b4bcb10bbaf9370de4d83b39c73e4eeb57bd5db0f19"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.219.0/aosterm-linux-arm64"
        sha256 "6e9e574bd89e6ec227722b4bcb10bbaf9370de4d83b39c73e4eeb57bd5db0f19"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("agent-terminal").stage { bin.install Dir["agent-terminal-*"].first => "agent-terminal" }
    resource("aosterm").stage { bin.install Dir["aosterm-*"].first => "aosterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
    assert_match version.to_s, shell_output("#{bin}/aosterm --version")
  end
end
