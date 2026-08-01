class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.150.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aos-darwin-arm64"
      sha256 "850aa74dd2776d0db2523314c58baa98580ae0d86acf2291262413d82838109f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aoscompose-darwin-arm64"
        sha256 "850aa74dd2776d0db2523314c58baa98580ae0d86acf2291262413d82838109f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aosward-darwin-arm64"
        sha256 "850aa74dd2776d0db2523314c58baa98580ae0d86acf2291262413d82838109f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aosguard-darwin-arm64"
        sha256 "e63f3c25a35a9478aaa0c20ac2a837a99b12bde5eba28e35c5ac5195ea4256ce"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/agent-terminal-darwin-arm64"
        sha256 "65019ff0790b36650e70a9d53108b456f78a6f4ac0253d37c44be4e0fed9ce95"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aos-linux-amd64"
      sha256 "c55f1d11b7140ac8b3033b59677d4c9b1fac2652c34ee90c623842464de74a37"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aoscompose-linux-amd64"
        sha256 "c55f1d11b7140ac8b3033b59677d4c9b1fac2652c34ee90c623842464de74a37"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aosward-linux-amd64"
        sha256 "c55f1d11b7140ac8b3033b59677d4c9b1fac2652c34ee90c623842464de74a37"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aosguard-linux-amd64"
        sha256 "ae40cfe728a04d79aede598d747c05e09c83e3e5e876b138f9109173ac8a8ff1"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/agent-terminal-linux-amd64"
        sha256 "2b6e7d4cbc5d63bf35e38133afd40b45e5835c663cd258f5bb28f8d62c17d7c3"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aos-linux-arm64"
      sha256 "86ec234009c966f65399ef07cb3b235ce767ff243790fe45fd6e8f47f111a41c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aoscompose-linux-arm64"
        sha256 "86ec234009c966f65399ef07cb3b235ce767ff243790fe45fd6e8f47f111a41c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aosward-linux-arm64"
        sha256 "86ec234009c966f65399ef07cb3b235ce767ff243790fe45fd6e8f47f111a41c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/aosguard-linux-arm64"
        sha256 "ee959cfcb0ef65835bc11bf357e23d4760df2967c9bd05bee058fb1217cb49be"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.150.0/agent-terminal-linux-arm64"
        sha256 "730abd3bbecb83c727248acfde15c909f0df6a3be53906894e879c5d2baa0170"
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
