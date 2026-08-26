class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.248.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aos-darwin-arm64"
      sha256 "b2c5672ad629c1321f0d5584a6c2ab72e1676057b685d6812ba9b740f4dc0d49"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aoscompose-darwin-arm64"
        sha256 "b2c5672ad629c1321f0d5584a6c2ab72e1676057b685d6812ba9b740f4dc0d49"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aosward-darwin-arm64"
        sha256 "b2c5672ad629c1321f0d5584a6c2ab72e1676057b685d6812ba9b740f4dc0d49"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aosguard-darwin-arm64"
        sha256 "21e5125cc4dc351d29dda98d1c7cba3dd05a42bc809996d43ff9a07ce118a395"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aterm-darwin-arm64"
        sha256 "af467fcda0eceb15ee10e18935eb26687984719a05aea61fc4fbc974c76dc01e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aos-linux-amd64"
      sha256 "eaf0710b0f87c735c58690fd1183b344c6168950a9ebd0c166a771c6b923a8fb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aoscompose-linux-amd64"
        sha256 "eaf0710b0f87c735c58690fd1183b344c6168950a9ebd0c166a771c6b923a8fb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aosward-linux-amd64"
        sha256 "eaf0710b0f87c735c58690fd1183b344c6168950a9ebd0c166a771c6b923a8fb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aosguard-linux-amd64"
        sha256 "7d3b75033ebfee338a988324ea761f2e83370d2378438ed1dce228cd155b70b2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aterm-linux-amd64"
        sha256 "0fe5aea730a53495bdb54c11763d2f2424b95ce45c1ce85dbba56fea00cdab6f"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aos-linux-arm64"
      sha256 "d2da5a14678bd163c6c25a56c403d64796a2c24319e8028e118b62ad41df4498"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aoscompose-linux-arm64"
        sha256 "d2da5a14678bd163c6c25a56c403d64796a2c24319e8028e118b62ad41df4498"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aosward-linux-arm64"
        sha256 "d2da5a14678bd163c6c25a56c403d64796a2c24319e8028e118b62ad41df4498"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aosguard-linux-arm64"
        sha256 "94cd6183d6df0895e01e3b4c362812fcfa81738dac10ce09a9419a2aa72021c6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.248.0/aterm-linux-arm64"
        sha256 "518c7cc28add290c3641f4a3d39b171285c4437908f57b7c0d512309624612db"
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
