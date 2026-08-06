class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.170.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aos-darwin-arm64"
      sha256 "76eabf9df92a524b1d63699934e335d6554398b8c69cef09e0e67400947c2c54"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aoscompose-darwin-arm64"
        sha256 "76eabf9df92a524b1d63699934e335d6554398b8c69cef09e0e67400947c2c54"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aosward-darwin-arm64"
        sha256 "76eabf9df92a524b1d63699934e335d6554398b8c69cef09e0e67400947c2c54"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aosguard-darwin-arm64"
        sha256 "404da301e97499ed4fcf4f856c6593772271aa3d387874b0a134bc0f6fcaffe2"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/agent-terminal-darwin-arm64"
        sha256 "2ea8d0886165c8c9c8f441abc5a89e75ab09e7206ce9807de428493863ccadcb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aos-linux-amd64"
      sha256 "269edd688cedc86b398d7c42cd5137aab70616438220fb998f09905e551b6bac"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aoscompose-linux-amd64"
        sha256 "269edd688cedc86b398d7c42cd5137aab70616438220fb998f09905e551b6bac"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aosward-linux-amd64"
        sha256 "269edd688cedc86b398d7c42cd5137aab70616438220fb998f09905e551b6bac"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aosguard-linux-amd64"
        sha256 "b96bd7b824f82d7062827a91e295de5e9c62c80c3619dddc7102af60c6a2c092"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/agent-terminal-linux-amd64"
        sha256 "65acd5a7e8b801364202986b741b7c96a7cfcdd82799ed81857a38f4b2b35099"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aos-linux-arm64"
      sha256 "2adb879cbdd4413d21dcfc76a5ae6477e0d1a3055ec08a8df35ce69dcbf480a8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aoscompose-linux-arm64"
        sha256 "2adb879cbdd4413d21dcfc76a5ae6477e0d1a3055ec08a8df35ce69dcbf480a8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aosward-linux-arm64"
        sha256 "2adb879cbdd4413d21dcfc76a5ae6477e0d1a3055ec08a8df35ce69dcbf480a8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/aosguard-linux-arm64"
        sha256 "49077570c8d2b0c1cf9c8c9097e33b31d20125f54b0fcd7686f25cffc63c1b75"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.170.0/agent-terminal-linux-arm64"
        sha256 "e90f6d747ca3596186ed4d48a16598c9c18a5e132b5cf106109bb607cfe4ca3a"
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
