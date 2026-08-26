class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.238.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aos-darwin-arm64"
      sha256 "dac815889680dbc0cb3e7fb1beeff0f55b3240e5475d5411bde3be6af2058c06"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aoscompose-darwin-arm64"
        sha256 "dac815889680dbc0cb3e7fb1beeff0f55b3240e5475d5411bde3be6af2058c06"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aosward-darwin-arm64"
        sha256 "dac815889680dbc0cb3e7fb1beeff0f55b3240e5475d5411bde3be6af2058c06"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aosguard-darwin-arm64"
        sha256 "2930ecd64f698e1f1827e2c03c23d92e32157c8935679583b0c85b5253256757"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aterm-darwin-arm64"
        sha256 "82970cdd6d04364f4684d6a21a1eb259bf8bd02ac6319acc3bdffc67497b2b73"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aos-linux-amd64"
      sha256 "26b03047635b02963728193dbf4c3150e36332b44ff8a6973283b7df8e2bb92f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aoscompose-linux-amd64"
        sha256 "26b03047635b02963728193dbf4c3150e36332b44ff8a6973283b7df8e2bb92f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aosward-linux-amd64"
        sha256 "26b03047635b02963728193dbf4c3150e36332b44ff8a6973283b7df8e2bb92f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aosguard-linux-amd64"
        sha256 "d89c5d009b252bfcdc2a72536611c6c50f53a9afcf5cfd1a3f52f960eabbdae3"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aterm-linux-amd64"
        sha256 "9c1cc60d7fe8431751186a76fdb95af4fe27c377903913ac46bbe8f866581de5"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aos-linux-arm64"
      sha256 "56cbaa10ef33264fdcf68171d2f073b4d6c965f2e1c086cfc129feeb190e5d5e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aoscompose-linux-arm64"
        sha256 "56cbaa10ef33264fdcf68171d2f073b4d6c965f2e1c086cfc129feeb190e5d5e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aosward-linux-arm64"
        sha256 "56cbaa10ef33264fdcf68171d2f073b4d6c965f2e1c086cfc129feeb190e5d5e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aosguard-linux-arm64"
        sha256 "1fe12334a444d5c6177f52ff47a89aee9f7a2aaf478f9f92a265f42906e54eb9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.238.0/aterm-linux-arm64"
        sha256 "987c723eed04ed1053749d5478bc68f24dc537361635ccd47b58d0fa838a6c47"
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
