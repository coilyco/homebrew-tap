class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.257.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aos-darwin-arm64"
      sha256 "89dabef030edc8c846aa359841d3d44dc3b585cb2c103864125b9876655a0685"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aoscompose-darwin-arm64"
        sha256 "89dabef030edc8c846aa359841d3d44dc3b585cb2c103864125b9876655a0685"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aosward-darwin-arm64"
        sha256 "89dabef030edc8c846aa359841d3d44dc3b585cb2c103864125b9876655a0685"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aosguard-darwin-arm64"
        sha256 "d70cb98c39e623124b504874b471573c9e937cccb93b83bf9e0eb5d0eb192a1d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aterm-darwin-arm64"
        sha256 "43eaf7cbce959cc717145bbc2f8ccb98014a27b637bfff87b8ac267cce99afec"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aos-linux-amd64"
      sha256 "d8a703b2297d9effe8eecce879a9ccb8b137dd53f61742bffa766a272999919c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aoscompose-linux-amd64"
        sha256 "d8a703b2297d9effe8eecce879a9ccb8b137dd53f61742bffa766a272999919c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aosward-linux-amd64"
        sha256 "d8a703b2297d9effe8eecce879a9ccb8b137dd53f61742bffa766a272999919c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aosguard-linux-amd64"
        sha256 "4b6268297caf8a0839b81474250d2c836feb869c9a3518087f6006e37214ce27"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aterm-linux-amd64"
        sha256 "0d6306cba3202d75ea7543081a0b18bc9c3962468aee58faef018447b3aa6a04"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aos-linux-arm64"
      sha256 "ed22de27c58df3b27404efd433aa569189e9c4220c1f375d0480b89adeb96d46"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aoscompose-linux-arm64"
        sha256 "ed22de27c58df3b27404efd433aa569189e9c4220c1f375d0480b89adeb96d46"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aosward-linux-arm64"
        sha256 "ed22de27c58df3b27404efd433aa569189e9c4220c1f375d0480b89adeb96d46"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aosguard-linux-arm64"
        sha256 "1c99865d3b88c0ae8c5e0410091644948c06161b1a38a3db94be9e78b8b27f81"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.257.0/aterm-linux-arm64"
        sha256 "71fcbd8c4c9debb55146f51c8291e42e724fa460900fc84bf25fe54a02e6d307"
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
