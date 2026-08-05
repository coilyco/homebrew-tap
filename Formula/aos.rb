class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.164.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aos-darwin-arm64"
      sha256 "a1a1515a87226762330a775e15d74017f0b8cf78625e7172bbc23dbe79762a17"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aoscompose-darwin-arm64"
        sha256 "a1a1515a87226762330a775e15d74017f0b8cf78625e7172bbc23dbe79762a17"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aosward-darwin-arm64"
        sha256 "a1a1515a87226762330a775e15d74017f0b8cf78625e7172bbc23dbe79762a17"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aosguard-darwin-arm64"
        sha256 "1c6ac83a61c50b578a0351ba87f8dc91541b68b5ab696558d48ad532c2e48ef8"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/agent-terminal-darwin-arm64"
        sha256 "beec5f73723b1afec9dbe83237694bd9443848fc4ff77a4babc01493c6be43b8"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aos-linux-amd64"
      sha256 "c2c0be82b2eae06feecd491720a63e832f316d264e335131f37d6a10d0456aba"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aoscompose-linux-amd64"
        sha256 "c2c0be82b2eae06feecd491720a63e832f316d264e335131f37d6a10d0456aba"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aosward-linux-amd64"
        sha256 "c2c0be82b2eae06feecd491720a63e832f316d264e335131f37d6a10d0456aba"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aosguard-linux-amd64"
        sha256 "1feeffa54e032f83880ba4e328742b9cc86c83bc95c1d9e5bf3bbe46bafcfce3"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/agent-terminal-linux-amd64"
        sha256 "b7870bb5aa0886dfce1ce5a79cb7811b4e66eb92fffc529e808c557b4dc21d33"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aos-linux-arm64"
      sha256 "d91cdfcd122a50c23e1da9bab5490dcc3bc56ebf7de9ab75afaae5522e9ce8aa"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aoscompose-linux-arm64"
        sha256 "d91cdfcd122a50c23e1da9bab5490dcc3bc56ebf7de9ab75afaae5522e9ce8aa"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aosward-linux-arm64"
        sha256 "d91cdfcd122a50c23e1da9bab5490dcc3bc56ebf7de9ab75afaae5522e9ce8aa"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/aosguard-linux-arm64"
        sha256 "abd001af1cd6cae3b46dea5babe65f5687717a7921da25aacb95f778f6432434"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.164.0/agent-terminal-linux-arm64"
        sha256 "61614d60f45ac180347bdec71f58c21aee0c944e188d36eaf32f2edc4e68e28c"
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
