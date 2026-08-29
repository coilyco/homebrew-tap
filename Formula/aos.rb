class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.276.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aos-darwin-arm64"
      sha256 "00845e6a14741c8346aa4ab37aaa222d25a5b79b0dc8a2c3f88bc96eff95983b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aoscompose-darwin-arm64"
        sha256 "00845e6a14741c8346aa4ab37aaa222d25a5b79b0dc8a2c3f88bc96eff95983b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aosward-darwin-arm64"
        sha256 "00845e6a14741c8346aa4ab37aaa222d25a5b79b0dc8a2c3f88bc96eff95983b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aosguard-darwin-arm64"
        sha256 "9f6139005881af56f73f6b24de7d519b10ae65f0d2612f8270608015afdf0225"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aterm-darwin-arm64"
        sha256 "6b6cce04bbfedfd47a98e66ba7c835b0a8686d2203429a9994ce19416f6fe47d"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aos-linux-amd64"
      sha256 "b6979181bd59b5870509e819a79bf13260e1c2c48c4cb7883187a52f5c0d00d9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aoscompose-linux-amd64"
        sha256 "b6979181bd59b5870509e819a79bf13260e1c2c48c4cb7883187a52f5c0d00d9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aosward-linux-amd64"
        sha256 "b6979181bd59b5870509e819a79bf13260e1c2c48c4cb7883187a52f5c0d00d9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aosguard-linux-amd64"
        sha256 "e79c76fece662ba42926d82cf00a13bdfe12b1e50c55f40fe4d87c879c44468d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aterm-linux-amd64"
        sha256 "1b334aff7f0b47b3e74d0373f2548450ea9bae813b82d6abf474c1b31826d96e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aos-linux-arm64"
      sha256 "c2e9ce4761fc922167186489f0303e7bfb88169f76009475dfec3942221cb538"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aoscompose-linux-arm64"
        sha256 "c2e9ce4761fc922167186489f0303e7bfb88169f76009475dfec3942221cb538"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aosward-linux-arm64"
        sha256 "c2e9ce4761fc922167186489f0303e7bfb88169f76009475dfec3942221cb538"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aosguard-linux-arm64"
        sha256 "212c294440162f617002a3f558eb285d446dd69a7b8ab4d01e82fc3e67d076d4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.276.0/aterm-linux-arm64"
        sha256 "ecd164c5fe0d6165dee4e5c289f69074af05a7e87bf522398bd4f45ad2c64286"
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
