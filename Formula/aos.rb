class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.202.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aos-darwin-arm64"
      sha256 "36f242bd3bd54be134a56918a5b017c3afe9ef0515874f4f17032e61019d2790"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aoscompose-darwin-arm64"
        sha256 "36f242bd3bd54be134a56918a5b017c3afe9ef0515874f4f17032e61019d2790"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosward-darwin-arm64"
        sha256 "36f242bd3bd54be134a56918a5b017c3afe9ef0515874f4f17032e61019d2790"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosguard-darwin-arm64"
        sha256 "c9266716d449410fbe9c3c5c34782bd7be70eba7c7e1e4d18d231fbde7488024"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/agent-terminal-darwin-arm64"
        sha256 "736c8a8449472aa019f9b2514c8ccb6de56fc2e514e90c15015989ea5879cc33"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosterm-darwin-arm64"
        sha256 "736c8a8449472aa019f9b2514c8ccb6de56fc2e514e90c15015989ea5879cc33"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aos-linux-amd64"
      sha256 "eeffdfbdf17f3261ee48de990275bf0e154b86705a2e0cdf04e66a4dc59ea473"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aoscompose-linux-amd64"
        sha256 "eeffdfbdf17f3261ee48de990275bf0e154b86705a2e0cdf04e66a4dc59ea473"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosward-linux-amd64"
        sha256 "eeffdfbdf17f3261ee48de990275bf0e154b86705a2e0cdf04e66a4dc59ea473"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosguard-linux-amd64"
        sha256 "79b6a647b433e67555fc6cae22f29f5bfafe17d598f4cd3d14bb167997ea2f93"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/agent-terminal-linux-amd64"
        sha256 "50614f252d9f171b5f222bc931b20c64ac9aabb4d2587cd9e837fdbff4f3da7d"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosterm-linux-amd64"
        sha256 "50614f252d9f171b5f222bc931b20c64ac9aabb4d2587cd9e837fdbff4f3da7d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aos-linux-arm64"
      sha256 "44f69bdb80c927724176cebf66ed00e20c9e487fa8cacf96371a53a73d9c715f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aoscompose-linux-arm64"
        sha256 "44f69bdb80c927724176cebf66ed00e20c9e487fa8cacf96371a53a73d9c715f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosward-linux-arm64"
        sha256 "44f69bdb80c927724176cebf66ed00e20c9e487fa8cacf96371a53a73d9c715f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosguard-linux-arm64"
        sha256 "07e73a2cb6e7075a8b173c65c8456d43b86e31764e7521c2beed768a2018c43c"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/agent-terminal-linux-arm64"
        sha256 "671b6055a9efa45e2349cbbac6757773726ed18063907dfc97d4106c49613cb5"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.202.0/aosterm-linux-arm64"
        sha256 "671b6055a9efa45e2349cbbac6757773726ed18063907dfc97d4106c49613cb5"
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
