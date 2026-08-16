class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.208.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aos-darwin-arm64"
      sha256 "d70451bc84c80cdb975910353f0ce814a81cf2460552837ca40c9c66f40593cb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aoscompose-darwin-arm64"
        sha256 "d70451bc84c80cdb975910353f0ce814a81cf2460552837ca40c9c66f40593cb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosward-darwin-arm64"
        sha256 "d70451bc84c80cdb975910353f0ce814a81cf2460552837ca40c9c66f40593cb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosguard-darwin-arm64"
        sha256 "240b007945803ac3c7bda8ff310df18501f31c2e9db3b6ee4936f1e29c24fde7"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/agent-terminal-darwin-arm64"
        sha256 "f34be02e3f4a1b283aac7864638bf356818b1fd06c7f46aec57562cedd8c5321"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosterm-darwin-arm64"
        sha256 "f34be02e3f4a1b283aac7864638bf356818b1fd06c7f46aec57562cedd8c5321"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aos-linux-amd64"
      sha256 "fad2b665241657bec157970f198813577cc0eecb8b54296cabb0cfbc64e1ccff"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aoscompose-linux-amd64"
        sha256 "fad2b665241657bec157970f198813577cc0eecb8b54296cabb0cfbc64e1ccff"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosward-linux-amd64"
        sha256 "fad2b665241657bec157970f198813577cc0eecb8b54296cabb0cfbc64e1ccff"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosguard-linux-amd64"
        sha256 "b0acd2d9cef21a9caf301d67422f9a9c0bbab10febeb08eb50421f57b5282242"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/agent-terminal-linux-amd64"
        sha256 "7de53aea297641c096cfe1fc99e8ba1e6a8ff915b467fe7440dcd250dbf8b80a"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosterm-linux-amd64"
        sha256 "7de53aea297641c096cfe1fc99e8ba1e6a8ff915b467fe7440dcd250dbf8b80a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aos-linux-arm64"
      sha256 "f46177239e23ca3e426bba657ffe96dabf2a4a447073f71f2188d43a07b19b63"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aoscompose-linux-arm64"
        sha256 "f46177239e23ca3e426bba657ffe96dabf2a4a447073f71f2188d43a07b19b63"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosward-linux-arm64"
        sha256 "f46177239e23ca3e426bba657ffe96dabf2a4a447073f71f2188d43a07b19b63"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosguard-linux-arm64"
        sha256 "6f6d308ba55c03baa9c7f4abba8ea4776b91891bb3b03a63f3434c37f4e38bec"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/agent-terminal-linux-arm64"
        sha256 "36fbee992ade15cb74b5bd0444ec6277a9aa0cf7f551253a735277af90287663"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.208.0/aosterm-linux-arm64"
        sha256 "36fbee992ade15cb74b5bd0444ec6277a9aa0cf7f551253a735277af90287663"
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
