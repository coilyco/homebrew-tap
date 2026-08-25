class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.224.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aos-darwin-arm64"
      sha256 "29a9cb8523d5841c0504a2bf49c46b8c4cd3c0a82afa21fcd3a1ca5f55328518"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aoscompose-darwin-arm64"
        sha256 "29a9cb8523d5841c0504a2bf49c46b8c4cd3c0a82afa21fcd3a1ca5f55328518"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosward-darwin-arm64"
        sha256 "29a9cb8523d5841c0504a2bf49c46b8c4cd3c0a82afa21fcd3a1ca5f55328518"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosguard-darwin-arm64"
        sha256 "5f72e5d34c86ae16f821210393f04c836ce36f9ae8956111c089109fc74c19f9"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/agent-terminal-darwin-arm64"
        sha256 "c41fc78749bc54b08827562bf9afca55716a30d20801487856dc64a6405aff44"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosterm-darwin-arm64"
        sha256 "c41fc78749bc54b08827562bf9afca55716a30d20801487856dc64a6405aff44"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aos-linux-amd64"
      sha256 "0b20a1ef3cdedc8e69d7caaf67aa87a434803dbdd258229bf2dca33932b97257"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aoscompose-linux-amd64"
        sha256 "0b20a1ef3cdedc8e69d7caaf67aa87a434803dbdd258229bf2dca33932b97257"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosward-linux-amd64"
        sha256 "0b20a1ef3cdedc8e69d7caaf67aa87a434803dbdd258229bf2dca33932b97257"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosguard-linux-amd64"
        sha256 "7536e597b267cbcbe1bb5ac14a547916d1da5639c449e98b4d029d4cf932bc05"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/agent-terminal-linux-amd64"
        sha256 "2767ddebef2df8172576e24c567c8ee0705b99169beb6464227c157e353054d9"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosterm-linux-amd64"
        sha256 "2767ddebef2df8172576e24c567c8ee0705b99169beb6464227c157e353054d9"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aos-linux-arm64"
      sha256 "06fabf70feac1dcddc6be4803fcc0feef94fd6e20c267ff1723f41e9f536ae66"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aoscompose-linux-arm64"
        sha256 "06fabf70feac1dcddc6be4803fcc0feef94fd6e20c267ff1723f41e9f536ae66"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosward-linux-arm64"
        sha256 "06fabf70feac1dcddc6be4803fcc0feef94fd6e20c267ff1723f41e9f536ae66"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosguard-linux-arm64"
        sha256 "9ae2b72e967ecbf78cba13a74fa9c72f6aa28b249f565ae15ebb0a75d80c9cd8"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/agent-terminal-linux-arm64"
        sha256 "4d9ebcc55ccfe94b62b579bd1528f288a158cd8f2e8704e9b131acbd41dd7ccc"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.224.0/aosterm-linux-arm64"
        sha256 "4d9ebcc55ccfe94b62b579bd1528f288a158cd8f2e8704e9b131acbd41dd7ccc"
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
