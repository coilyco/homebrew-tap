class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.206.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aos-darwin-arm64"
      sha256 "53d4c09a6f3742841e5f63d24322c6fd6635b1534f156d648d8c2889e370bebf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aoscompose-darwin-arm64"
        sha256 "53d4c09a6f3742841e5f63d24322c6fd6635b1534f156d648d8c2889e370bebf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosward-darwin-arm64"
        sha256 "53d4c09a6f3742841e5f63d24322c6fd6635b1534f156d648d8c2889e370bebf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosguard-darwin-arm64"
        sha256 "257425b625c66442ee733fd2f262cbecd42105770ce4ee40598f2ea25e5d837b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/agent-terminal-darwin-arm64"
        sha256 "7fcb674c113c1a9f79d4f991795c898229a2f47c5fdae74506b73c9ed8a26c4b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosterm-darwin-arm64"
        sha256 "7fcb674c113c1a9f79d4f991795c898229a2f47c5fdae74506b73c9ed8a26c4b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aos-linux-amd64"
      sha256 "34e2d64d7888d59e833e4330bd91fc72feb707420a10203d1cdc0f3a83862cbe"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aoscompose-linux-amd64"
        sha256 "34e2d64d7888d59e833e4330bd91fc72feb707420a10203d1cdc0f3a83862cbe"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosward-linux-amd64"
        sha256 "34e2d64d7888d59e833e4330bd91fc72feb707420a10203d1cdc0f3a83862cbe"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosguard-linux-amd64"
        sha256 "f561cbc7a1f59b0eb56f535e42db3e474271b0e999601f2a0ed72d0c093bebd6"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/agent-terminal-linux-amd64"
        sha256 "28d6c280d7e855d8ed2b2c89bd5cdf721f340a532666b8a45aa57d2393f65a76"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosterm-linux-amd64"
        sha256 "28d6c280d7e855d8ed2b2c89bd5cdf721f340a532666b8a45aa57d2393f65a76"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aos-linux-arm64"
      sha256 "dce96f64af66a545b3be1f65dbcc0a7ed1a34d5294985aed6f68ccb5f75255d0"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aoscompose-linux-arm64"
        sha256 "dce96f64af66a545b3be1f65dbcc0a7ed1a34d5294985aed6f68ccb5f75255d0"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosward-linux-arm64"
        sha256 "dce96f64af66a545b3be1f65dbcc0a7ed1a34d5294985aed6f68ccb5f75255d0"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosguard-linux-arm64"
        sha256 "d7b0f3720b8d9d018a2b04691e6bbf16a987bcde1d35716f534b4711c97d916b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/agent-terminal-linux-arm64"
        sha256 "235cd4a9a6d0ed44428a11617bf2cc37a00c817ce47c613818375e3011ed7336"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.206.0/aosterm-linux-arm64"
        sha256 "235cd4a9a6d0ed44428a11617bf2cc37a00c817ce47c613818375e3011ed7336"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("agent-terminal").stage { bin.install Dir["agent-terminal-*"].first => "agent-terminal" }
    resource("aosterm").stage { bin.install Dir["aosterm-*"].first => "aosterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
    assert_match version.to_s, shell_output("#{bin}/aosterm --version")
  end
end
