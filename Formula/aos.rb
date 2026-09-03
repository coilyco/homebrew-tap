class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.300.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aos-darwin-arm64"
      sha256 "4b4801c32e4cfe34eac0b7251312970bada33f361f3d50f31e64a4cdfc891218"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aoscompose-darwin-arm64"
        sha256 "4b4801c32e4cfe34eac0b7251312970bada33f361f3d50f31e64a4cdfc891218"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aosward-darwin-arm64"
        sha256 "4b4801c32e4cfe34eac0b7251312970bada33f361f3d50f31e64a4cdfc891218"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aosguard-darwin-arm64"
        sha256 "c17712be5fd92bec609f257943249c57a3a68e0e070ec1f78c8789e37048f69f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aterm-darwin-arm64"
        sha256 "bf96ad4d6ed8673557cbe9c665c039467f7b6b1e8a365efbdf8a9af8cd9c50af"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aos-linux-amd64"
      sha256 "3175381889d2816841a650fc2e8d0f4e36f2ca805dfa90ffbb94c752ddd7ff8f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aoscompose-linux-amd64"
        sha256 "3175381889d2816841a650fc2e8d0f4e36f2ca805dfa90ffbb94c752ddd7ff8f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aosward-linux-amd64"
        sha256 "3175381889d2816841a650fc2e8d0f4e36f2ca805dfa90ffbb94c752ddd7ff8f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aosguard-linux-amd64"
        sha256 "a49a1b49189a851208d380640ead7fc2d598723c0d7631e29f36c5518e7898e6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aterm-linux-amd64"
        sha256 "baadeab2097a03f938cab2182aec6f55c89a350e71218c22e2af86a80be31bfd"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aos-linux-arm64"
      sha256 "50a0422c71298c4382e16dfb2802e0f6d9a0567771fb8bc6f5e3d80e95c70f97"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aoscompose-linux-arm64"
        sha256 "50a0422c71298c4382e16dfb2802e0f6d9a0567771fb8bc6f5e3d80e95c70f97"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aosward-linux-arm64"
        sha256 "50a0422c71298c4382e16dfb2802e0f6d9a0567771fb8bc6f5e3d80e95c70f97"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aosguard-linux-arm64"
        sha256 "6df959b542a951d1d0f9b5e8b4030387c47b5f1a98f0eaaab644984709bbe9c5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.300.0/aterm-linux-arm64"
        sha256 "de277bd9944ad5b0bbdb49d5429397ac61faa824a55f25b09bd2794f6cc18630"
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
