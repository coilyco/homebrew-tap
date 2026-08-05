class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.163.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aos-darwin-arm64"
      sha256 "fc210fd1660b402c5b8a5678d565cc0dfda642767715bc11ad765d151aaa4f95"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aoscompose-darwin-arm64"
        sha256 "fc210fd1660b402c5b8a5678d565cc0dfda642767715bc11ad765d151aaa4f95"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aosward-darwin-arm64"
        sha256 "fc210fd1660b402c5b8a5678d565cc0dfda642767715bc11ad765d151aaa4f95"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aosguard-darwin-arm64"
        sha256 "0f48d63c4d28cc9ba3631fb2bcf3ca7d6c0b097ab3a7aad4bf9d00073da3cc88"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/agent-terminal-darwin-arm64"
        sha256 "048770f8f38f3b5446a20924c10a73fef734d80cee8a4d9d06a86ac1fe7d9bb4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aos-linux-amd64"
      sha256 "52b6fdaa25c49c0efb6f0941d39eb5e67c5f8374bd20f6a72c19c0a28f67a153"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aoscompose-linux-amd64"
        sha256 "52b6fdaa25c49c0efb6f0941d39eb5e67c5f8374bd20f6a72c19c0a28f67a153"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aosward-linux-amd64"
        sha256 "52b6fdaa25c49c0efb6f0941d39eb5e67c5f8374bd20f6a72c19c0a28f67a153"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aosguard-linux-amd64"
        sha256 "b98ba185e3691dd5732dc4b3a98dc2e1a065f86fec83242959255b1eeff17b8b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/agent-terminal-linux-amd64"
        sha256 "8be203689e809d55f722b06f5d9ce9ae1d7f0210cd13309a8e15fa6b70ed1601"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aos-linux-arm64"
      sha256 "83df398ece5f4fd78dddd698b2dfd0ec18bf739e7a7526c9a643cd6bd1a59006"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aoscompose-linux-arm64"
        sha256 "83df398ece5f4fd78dddd698b2dfd0ec18bf739e7a7526c9a643cd6bd1a59006"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aosward-linux-arm64"
        sha256 "83df398ece5f4fd78dddd698b2dfd0ec18bf739e7a7526c9a643cd6bd1a59006"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/aosguard-linux-arm64"
        sha256 "a68e8d037b4cc33b87a61f57e18876191b19486c119e4ad41f415e93af638ae3"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.163.0/agent-terminal-linux-arm64"
        sha256 "a3e93b5f937809e68cc4d4b0e582639ce4f34a92748449c5d77b8cdbce8649e6"
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
