class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.221.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aos-darwin-arm64"
      sha256 "1c381a3880d28cc86ad78ca5ef90ed665eabfecf83debf165c3db7cd208e9028"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aoscompose-darwin-arm64"
        sha256 "1c381a3880d28cc86ad78ca5ef90ed665eabfecf83debf165c3db7cd208e9028"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosward-darwin-arm64"
        sha256 "1c381a3880d28cc86ad78ca5ef90ed665eabfecf83debf165c3db7cd208e9028"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosguard-darwin-arm64"
        sha256 "58990bddd5e42e7d0067a8df3429479179e577bdeb3297925019e06d6ab4c314"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/agent-terminal-darwin-arm64"
        sha256 "e1e59be4aa82cb284151b6b733b21b897733c69176d3937d3c6c4a7ebdae56cf"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosterm-darwin-arm64"
        sha256 "e1e59be4aa82cb284151b6b733b21b897733c69176d3937d3c6c4a7ebdae56cf"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aos-linux-amd64"
      sha256 "ff4d814fcef2ddf78cd0781e107d2a7094680258429c3cec274f3f1001afb0f4"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aoscompose-linux-amd64"
        sha256 "ff4d814fcef2ddf78cd0781e107d2a7094680258429c3cec274f3f1001afb0f4"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosward-linux-amd64"
        sha256 "ff4d814fcef2ddf78cd0781e107d2a7094680258429c3cec274f3f1001afb0f4"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosguard-linux-amd64"
        sha256 "86bcc1249eaeab2f6658b68d12341254a39ecb55ca9f8cd6fc7c433bd80bfc61"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/agent-terminal-linux-amd64"
        sha256 "17cec7c683ae89e1fdaa08f535e358b94f6fd5bc57426d28d287ac584c4d9a82"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosterm-linux-amd64"
        sha256 "17cec7c683ae89e1fdaa08f535e358b94f6fd5bc57426d28d287ac584c4d9a82"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aos-linux-arm64"
      sha256 "9721eda80286bbf453bde0c22e3f909233b0473bf986365efbb597ec9647e870"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aoscompose-linux-arm64"
        sha256 "9721eda80286bbf453bde0c22e3f909233b0473bf986365efbb597ec9647e870"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosward-linux-arm64"
        sha256 "9721eda80286bbf453bde0c22e3f909233b0473bf986365efbb597ec9647e870"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosguard-linux-arm64"
        sha256 "b204595f01fdc9e0efea7318a7c42086817e4f6f49f57fc8c0e22c82330f114d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/agent-terminal-linux-arm64"
        sha256 "ae31f275ee3b1a70a03131e7e7233e6f01eb9e9d571955e2acc3c071f8153a42"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.221.0/aosterm-linux-arm64"
        sha256 "ae31f275ee3b1a70a03131e7e7233e6f01eb9e9d571955e2acc3c071f8153a42"
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
