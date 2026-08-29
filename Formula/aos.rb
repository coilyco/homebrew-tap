class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.266.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aos-darwin-arm64"
      sha256 "4e3d55fe4e7b71808ce96c4996c500a294a3f705f766dadffb72474b330f22bd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aoscompose-darwin-arm64"
        sha256 "4e3d55fe4e7b71808ce96c4996c500a294a3f705f766dadffb72474b330f22bd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aosward-darwin-arm64"
        sha256 "4e3d55fe4e7b71808ce96c4996c500a294a3f705f766dadffb72474b330f22bd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aosguard-darwin-arm64"
        sha256 "0ce7bf7f96615601b96cb5b46127b7440f7526a1c9fadb9c393898c577ba9561"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aterm-darwin-arm64"
        sha256 "0ea7f96f1bcf7cce9aa8d73c44161d5abb1ca28e0129af62bc79b85465f83604"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aos-linux-amd64"
      sha256 "c4ac6e58c27b910ade1435e7240f006a5c04fdea63c722992573828b221afc39"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aoscompose-linux-amd64"
        sha256 "c4ac6e58c27b910ade1435e7240f006a5c04fdea63c722992573828b221afc39"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aosward-linux-amd64"
        sha256 "c4ac6e58c27b910ade1435e7240f006a5c04fdea63c722992573828b221afc39"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aosguard-linux-amd64"
        sha256 "46c8b03fe31bae319f7ab88acd0deaf1695f96010df967fcdbff2298b2ed6bfe"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aterm-linux-amd64"
        sha256 "100f89333159e93c3784e435f82063f30b70a10da354c312588ce511bac93998"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aos-linux-arm64"
      sha256 "a76bc9460363fc14fdaad2f47e8d01211fd531cb1478fd36e570de9fe9b42d9f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aoscompose-linux-arm64"
        sha256 "a76bc9460363fc14fdaad2f47e8d01211fd531cb1478fd36e570de9fe9b42d9f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aosward-linux-arm64"
        sha256 "a76bc9460363fc14fdaad2f47e8d01211fd531cb1478fd36e570de9fe9b42d9f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aosguard-linux-arm64"
        sha256 "5c8a3609deec3beecdb9361d0bd24c904e27d42e9576550a0d287e9707ba5399"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.266.0/aterm-linux-arm64"
        sha256 "81c4a735d0b1f38bcdf295b79bded33d94eae90354cbbe53ff5c5474f383e465"
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
