class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.322.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aos-darwin-arm64"
      sha256 "445f2c2b732f2f13bebf0305fc5f2cb1f10915c6950dc6bbd81cff8b2eadfc55"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aoscompose-darwin-arm64"
        sha256 "445f2c2b732f2f13bebf0305fc5f2cb1f10915c6950dc6bbd81cff8b2eadfc55"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aosward-darwin-arm64"
        sha256 "445f2c2b732f2f13bebf0305fc5f2cb1f10915c6950dc6bbd81cff8b2eadfc55"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aosguard-darwin-arm64"
        sha256 "341bdf1c9ee0cd346879798c630fb415bf34e0322a9ab365eb91aab2aef08668"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aterm-darwin-arm64"
        sha256 "5fba1d82ba817fe04e9ac5486ef42fab2e827014b596f6b5940e86f4aab60aeb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aos-linux-amd64"
      sha256 "5c2c82a040e724caea45b5280b79b7855b5ae59fc967c5cc049c56358a3af696"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aoscompose-linux-amd64"
        sha256 "5c2c82a040e724caea45b5280b79b7855b5ae59fc967c5cc049c56358a3af696"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aosward-linux-amd64"
        sha256 "5c2c82a040e724caea45b5280b79b7855b5ae59fc967c5cc049c56358a3af696"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aosguard-linux-amd64"
        sha256 "5d2d622ca42f7484ba27d8d1d4f9fc03d4ea8c7debf1a279c2d98d96bef14f69"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aterm-linux-amd64"
        sha256 "f3ff65561f99cdf02020be424628e5e90d53ebb3fc7a4d95d4b2a8f1b7dd36df"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aos-linux-arm64"
      sha256 "0706126f3ed79e09be54c8911cdb5e8a60032193740b6f8e596268a4a258b03a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aoscompose-linux-arm64"
        sha256 "0706126f3ed79e09be54c8911cdb5e8a60032193740b6f8e596268a4a258b03a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aosward-linux-arm64"
        sha256 "0706126f3ed79e09be54c8911cdb5e8a60032193740b6f8e596268a4a258b03a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aosguard-linux-arm64"
        sha256 "34feeb032d910f02ba124d3786e981568f00f53cebedb8c40a5e95be3f3cdc65"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.322.0/aterm-linux-arm64"
        sha256 "adfe0cf845e5d38ae5e5af3fce6603737af1a3e2e926ab6659423c1dd99003e2"
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
