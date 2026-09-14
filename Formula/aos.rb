class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.334.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aos-darwin-arm64"
      sha256 "2bd312bb683f235e6eaee8c559d278116e09ea544cfc7fffeb1c31b904c0da8b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aoscompose-darwin-arm64"
        sha256 "2bd312bb683f235e6eaee8c559d278116e09ea544cfc7fffeb1c31b904c0da8b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aosward-darwin-arm64"
        sha256 "2bd312bb683f235e6eaee8c559d278116e09ea544cfc7fffeb1c31b904c0da8b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aosguard-darwin-arm64"
        sha256 "6159a190332b9ca2075a19e8ef23c39db19c13570e793b15bc7d418c51679e47"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aterm-darwin-arm64"
        sha256 "f8f7392e05d237fbc6172f30eda78aeb1e1aad18ea97876ab1b2e62429a7ddcb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aos-linux-amd64"
      sha256 "1024e83987d486e81caa91848cf71ca7e0d77d15623e0585b1968a905f55a82b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aoscompose-linux-amd64"
        sha256 "1024e83987d486e81caa91848cf71ca7e0d77d15623e0585b1968a905f55a82b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aosward-linux-amd64"
        sha256 "1024e83987d486e81caa91848cf71ca7e0d77d15623e0585b1968a905f55a82b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aosguard-linux-amd64"
        sha256 "abba58e017b3522eb152750874f1df5e1d67269cdb04c22b465f60992f740049"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aterm-linux-amd64"
        sha256 "f2669818572a68391964662f0189495da3533246604d81e31278f26f72f5ebf0"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aos-linux-arm64"
      sha256 "f65e99f0ae160d8d93053fd26b25a266f3f76204ad42d8d370548c7872344d77"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aoscompose-linux-arm64"
        sha256 "f65e99f0ae160d8d93053fd26b25a266f3f76204ad42d8d370548c7872344d77"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aosward-linux-arm64"
        sha256 "f65e99f0ae160d8d93053fd26b25a266f3f76204ad42d8d370548c7872344d77"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aosguard-linux-arm64"
        sha256 "111ae0305b477ebb67746f6b183fbd31f73bff830ddfda6bd19f602b5fec3cfe"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.334.0/aterm-linux-arm64"
        sha256 "a61cfa26cccd0a9ec17a72838de499f39c8181d9c67b7269a781cddfce3850ad"
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
