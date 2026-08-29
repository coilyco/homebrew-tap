class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.280.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aos-darwin-arm64"
      sha256 "8a6a7c8b0357a2ef67f5a9dfa5062301aafa88dde2f36698deb583068be69640"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aoscompose-darwin-arm64"
        sha256 "8a6a7c8b0357a2ef67f5a9dfa5062301aafa88dde2f36698deb583068be69640"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aosward-darwin-arm64"
        sha256 "8a6a7c8b0357a2ef67f5a9dfa5062301aafa88dde2f36698deb583068be69640"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aosguard-darwin-arm64"
        sha256 "89de29e558240c877718a80720be2504e082dcd4ddeb24839a696f73b2d8bf41"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aterm-darwin-arm64"
        sha256 "ae3d39d47691cc6e04cabe3a30758fbe5ef381b3aac6d354fc2daae8ef4893c4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aos-linux-amd64"
      sha256 "442c05d628feb114110aab0c86bd3cc0b9f821ec6efd99288a2f355fe4007793"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aoscompose-linux-amd64"
        sha256 "442c05d628feb114110aab0c86bd3cc0b9f821ec6efd99288a2f355fe4007793"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aosward-linux-amd64"
        sha256 "442c05d628feb114110aab0c86bd3cc0b9f821ec6efd99288a2f355fe4007793"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aosguard-linux-amd64"
        sha256 "7f57c9f220619f2cf258b1c452f73b5c6b0b2a79ea21c4485fbb4daa2932084f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aterm-linux-amd64"
        sha256 "a08e6d7ea3ce7edacb42b0dc700fe3d5ade7d838938dfa46f97f1c5f8b0acda9"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aos-linux-arm64"
      sha256 "19e0936a9622948e5378bb2636871799a3600babba4029b52978459b6c11cecc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aoscompose-linux-arm64"
        sha256 "19e0936a9622948e5378bb2636871799a3600babba4029b52978459b6c11cecc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aosward-linux-arm64"
        sha256 "19e0936a9622948e5378bb2636871799a3600babba4029b52978459b6c11cecc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aosguard-linux-arm64"
        sha256 "2ff337b814b5a35f3ff28ecd38894813635639b8d33c40f74a02617afa6d8110"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.280.0/aterm-linux-arm64"
        sha256 "3d02bb7f5912c2997e2f39e5bc47cb88aee951dec201bdf7b764c0a314743b90"
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
