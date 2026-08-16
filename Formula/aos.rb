class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.210.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aos-darwin-arm64"
      sha256 "c7135a57a1f1b78d564e054c8d0b5bd67e065d022dc1659db2a3bcc0280d2b16"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aoscompose-darwin-arm64"
        sha256 "c7135a57a1f1b78d564e054c8d0b5bd67e065d022dc1659db2a3bcc0280d2b16"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosward-darwin-arm64"
        sha256 "c7135a57a1f1b78d564e054c8d0b5bd67e065d022dc1659db2a3bcc0280d2b16"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosguard-darwin-arm64"
        sha256 "a2013db950b9eb1c4431bf1f6861969c19eff5f36f9005299dffeb6ba05f994a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/agent-terminal-darwin-arm64"
        sha256 "3e3829f8bcbdd8697fe5621d9eca4e8f9e60b1e72626e56c365aa07d8336d596"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosterm-darwin-arm64"
        sha256 "3e3829f8bcbdd8697fe5621d9eca4e8f9e60b1e72626e56c365aa07d8336d596"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aos-linux-amd64"
      sha256 "33469a2413c4a6824be652ba4c66c477354bbb41d0b5ba35502a65aa448a1bc9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aoscompose-linux-amd64"
        sha256 "33469a2413c4a6824be652ba4c66c477354bbb41d0b5ba35502a65aa448a1bc9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosward-linux-amd64"
        sha256 "33469a2413c4a6824be652ba4c66c477354bbb41d0b5ba35502a65aa448a1bc9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosguard-linux-amd64"
        sha256 "cc4e2ccc68b723ed038cb10a75672af7f909e6503d092e144639e7386d939d44"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/agent-terminal-linux-amd64"
        sha256 "f539f68adc57c85c9370ec2da3f750d2eb8201691031c0f647a357150d771765"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosterm-linux-amd64"
        sha256 "f539f68adc57c85c9370ec2da3f750d2eb8201691031c0f647a357150d771765"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aos-linux-arm64"
      sha256 "7bb4934a275d08ea37e99364cb4915a9729a2216bfe70543e019f161074b3e10"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aoscompose-linux-arm64"
        sha256 "7bb4934a275d08ea37e99364cb4915a9729a2216bfe70543e019f161074b3e10"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosward-linux-arm64"
        sha256 "7bb4934a275d08ea37e99364cb4915a9729a2216bfe70543e019f161074b3e10"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosguard-linux-arm64"
        sha256 "ce204dfd4dd12cce60b8f8a925f2dd0f0c9e4f05198d773fb5396f8509b383ca"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/agent-terminal-linux-arm64"
        sha256 "41e4f983b6ce2731b4c2918c2321cd446955bbd185e7d278cf4f16152ae6b6fe"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.210.0/aosterm-linux-arm64"
        sha256 "41e4f983b6ce2731b4c2918c2321cd446955bbd185e7d278cf4f16152ae6b6fe"
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
