class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.233.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aos-darwin-arm64"
      sha256 "8da21583396ae08b5f8a93b8d172b79b1f63600a2d72377a6bc85c8019b0f661"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aoscompose-darwin-arm64"
        sha256 "8da21583396ae08b5f8a93b8d172b79b1f63600a2d72377a6bc85c8019b0f661"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aosward-darwin-arm64"
        sha256 "8da21583396ae08b5f8a93b8d172b79b1f63600a2d72377a6bc85c8019b0f661"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aosguard-darwin-arm64"
        sha256 "af689558d718f1593785b5a183b048a84fd9abf0c05385c4537daa5d87d48baf"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aterm-darwin-arm64"
        sha256 "c8530d28d25f0bb4fee5b24a8cbabb43eb44a73d0aeeb48701bd89649e3cca5e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aos-linux-amd64"
      sha256 "c36a5fb649c70ab4ae6d7b5c37e270ab2ce2b3d1948077853b569336b0084f63"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aoscompose-linux-amd64"
        sha256 "c36a5fb649c70ab4ae6d7b5c37e270ab2ce2b3d1948077853b569336b0084f63"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aosward-linux-amd64"
        sha256 "c36a5fb649c70ab4ae6d7b5c37e270ab2ce2b3d1948077853b569336b0084f63"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aosguard-linux-amd64"
        sha256 "20e9832a04c2f42c5dcc017202cb247003816b2e214709c56999513686ef4806"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aterm-linux-amd64"
        sha256 "46b2dae8683849637d8d88c891dbbefb42100c4128f18e15c1948801a8651b4d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aos-linux-arm64"
      sha256 "5071efa0590b42c98a7cac872c783a1594d9718b0b2840fbdc7b0b8a390c8321"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aoscompose-linux-arm64"
        sha256 "5071efa0590b42c98a7cac872c783a1594d9718b0b2840fbdc7b0b8a390c8321"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aosward-linux-arm64"
        sha256 "5071efa0590b42c98a7cac872c783a1594d9718b0b2840fbdc7b0b8a390c8321"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aosguard-linux-arm64"
        sha256 "b26669161ed1e468422be04528086dcaa6d4756fafd0a433f2a8967a15955175"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.233.0/aterm-linux-arm64"
        sha256 "ba8c55add624ab59266a77a5a0757e1795c79ee92909e6000ee30822278d8f8d"
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
