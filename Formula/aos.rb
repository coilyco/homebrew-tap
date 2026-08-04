class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.153.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aos-darwin-arm64"
      sha256 "f98f7f471c79ff9b38a2f2d491f230641fc74be674a055030ed1e21d17354e4a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aoscompose-darwin-arm64"
        sha256 "f98f7f471c79ff9b38a2f2d491f230641fc74be674a055030ed1e21d17354e4a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aosward-darwin-arm64"
        sha256 "f98f7f471c79ff9b38a2f2d491f230641fc74be674a055030ed1e21d17354e4a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aosguard-darwin-arm64"
        sha256 "97f2a350cb2f27d67647f5012c34c807e098dcdae8e0b843b4297445e37bda42"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/agent-terminal-darwin-arm64"
        sha256 "06dc3080b2b337a2090e7d3398c6499c3d1d1f99da3794c71a491d11e96e2f61"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aos-linux-amd64"
      sha256 "cb245db65ba0748c756a36732b88b597a521946c0b81db9cf0071dca68c9423c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aoscompose-linux-amd64"
        sha256 "cb245db65ba0748c756a36732b88b597a521946c0b81db9cf0071dca68c9423c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aosward-linux-amd64"
        sha256 "cb245db65ba0748c756a36732b88b597a521946c0b81db9cf0071dca68c9423c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aosguard-linux-amd64"
        sha256 "5e6663ec06fbff7ce83d17c837da6d02b90dd6503b49aafe824118fb1bafc914"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/agent-terminal-linux-amd64"
        sha256 "441e4c9b2600b423e9d98ec2881de37225fd299f635ef3a548aaa527f421b07a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aos-linux-arm64"
      sha256 "2736f296ba0cfd1d4e00cbf43102c77793071b40e78ffc078da93d91b9ab22cc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aoscompose-linux-arm64"
        sha256 "2736f296ba0cfd1d4e00cbf43102c77793071b40e78ffc078da93d91b9ab22cc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aosward-linux-arm64"
        sha256 "2736f296ba0cfd1d4e00cbf43102c77793071b40e78ffc078da93d91b9ab22cc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/aosguard-linux-arm64"
        sha256 "52eee5c8d120bc38c9a919b048b261c5c9f14c4d0b140feb416266db0a22ad66"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.153.0/agent-terminal-linux-arm64"
        sha256 "514521ee67d581459d0b0c09132c3ca0c22fc9a90d84862108920327040b578c"
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
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/agent-terminal --version")
  end
end
