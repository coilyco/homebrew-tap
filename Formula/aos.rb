class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.383.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aos-darwin-arm64"
      sha256 "86fe289a2b548a2dcd88809b736622665f25fe964ac5501b65bf73700a8c1cc1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aoscompose-darwin-arm64"
        sha256 "86fe289a2b548a2dcd88809b736622665f25fe964ac5501b65bf73700a8c1cc1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aosward-darwin-arm64"
        sha256 "86fe289a2b548a2dcd88809b736622665f25fe964ac5501b65bf73700a8c1cc1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aosguard-darwin-arm64"
        sha256 "09e7b8411ad128d42a7d4fd24051604f9ec17cb38691fb237bd86f1108ee3c92"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aterm-darwin-arm64"
        sha256 "e05200b842cd8becdee5d14d63762f84ddb4fe0feb633476cc2d5d5399cae64b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aos-linux-amd64"
      sha256 "9bc28f17a5b474241b6f09ccad1f2e7bc255317fd8598bfc83525423052977b8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aoscompose-linux-amd64"
        sha256 "9bc28f17a5b474241b6f09ccad1f2e7bc255317fd8598bfc83525423052977b8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aosward-linux-amd64"
        sha256 "9bc28f17a5b474241b6f09ccad1f2e7bc255317fd8598bfc83525423052977b8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aosguard-linux-amd64"
        sha256 "94a39ebfea754249b7f80a06941f2d5b43c88efa3931580298c73e7f30a838d2"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aterm-linux-amd64"
        sha256 "a96cc699fbf6ec4a4c41b4e7d93bb8e6494f2c995a43e04a8d31624ea295a66b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aos-linux-arm64"
      sha256 "4922c8f6e9fb0fb660a83a06068d52dac8e2ddfd81b8dba6086218e2acd34621"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aoscompose-linux-arm64"
        sha256 "4922c8f6e9fb0fb660a83a06068d52dac8e2ddfd81b8dba6086218e2acd34621"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aosward-linux-arm64"
        sha256 "4922c8f6e9fb0fb660a83a06068d52dac8e2ddfd81b8dba6086218e2acd34621"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aosguard-linux-arm64"
        sha256 "ee99868e23bf221b38bd921c41bf068a8d369d5507a294cc636490c94af76fc6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.383.0/aterm-linux-arm64"
        sha256 "bb3c12685e9318193eeb0d8dde2181f508313c2d8431b5c2769a3a3ab4a9146a"
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
