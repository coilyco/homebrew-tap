class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.310.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aos-darwin-arm64"
      sha256 "78badd57942fdcd632d995433afb398d3e88b62e5d52525cd35ff465dc2a4c1a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aoscompose-darwin-arm64"
        sha256 "78badd57942fdcd632d995433afb398d3e88b62e5d52525cd35ff465dc2a4c1a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aosward-darwin-arm64"
        sha256 "78badd57942fdcd632d995433afb398d3e88b62e5d52525cd35ff465dc2a4c1a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aosguard-darwin-arm64"
        sha256 "2386271d64f9067aa5b5f102449fd781502f7fe9e43b121c48cdc1bde39c1f69"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aterm-darwin-arm64"
        sha256 "ee7c28c4586ec9e33e0061522b2fb6604fa54425970da0eb9bd4b991f00ff618"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aos-linux-amd64"
      sha256 "67637bd781920e22b8cc55e8b86e977fa6b82b4c6659a4613bb8417eb617b2de"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aoscompose-linux-amd64"
        sha256 "67637bd781920e22b8cc55e8b86e977fa6b82b4c6659a4613bb8417eb617b2de"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aosward-linux-amd64"
        sha256 "67637bd781920e22b8cc55e8b86e977fa6b82b4c6659a4613bb8417eb617b2de"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aosguard-linux-amd64"
        sha256 "607845aa21418d45a13f34b65870dcd1bf897395aaaaa0223fed2e1e19d025de"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aterm-linux-amd64"
        sha256 "928f80c000cdc412024a57688471de2aa6f30ca342aaecbceca1c65f689278cf"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aos-linux-arm64"
      sha256 "7e401ffc03d567b00964e4038822f1ddef487f4857384c39345884ebcd183a37"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aoscompose-linux-arm64"
        sha256 "7e401ffc03d567b00964e4038822f1ddef487f4857384c39345884ebcd183a37"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aosward-linux-arm64"
        sha256 "7e401ffc03d567b00964e4038822f1ddef487f4857384c39345884ebcd183a37"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aosguard-linux-arm64"
        sha256 "e6c79e6ce136c3843113a97913ff743d8c6e9bc161d13f057eff5bcbd99cdd3b"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.310.0/aterm-linux-arm64"
        sha256 "83a863166d7847c1cf829238c55521d027ebede5f798cef0d044a5182162c974"
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
