class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.222.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aos-darwin-arm64"
      sha256 "e76698340cf00f9636331798371ed37f21cee40f27055fc7ab83654be60961f1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aoscompose-darwin-arm64"
        sha256 "e76698340cf00f9636331798371ed37f21cee40f27055fc7ab83654be60961f1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosward-darwin-arm64"
        sha256 "e76698340cf00f9636331798371ed37f21cee40f27055fc7ab83654be60961f1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosguard-darwin-arm64"
        sha256 "0062cc13309747aa634ce5da5f0449cff6f400560513f29502b73fbd91db36c1"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/agent-terminal-darwin-arm64"
        sha256 "90ac9462c3fc99e5cff3cce46a6f11ef965c79c500412ceb7b51e3677bfaf858"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosterm-darwin-arm64"
        sha256 "90ac9462c3fc99e5cff3cce46a6f11ef965c79c500412ceb7b51e3677bfaf858"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aos-linux-amd64"
      sha256 "04b5b2804bd8e2b93cae267dd8a62b5f4fa22c82e85e7a119b78d30a1b730eba"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aoscompose-linux-amd64"
        sha256 "04b5b2804bd8e2b93cae267dd8a62b5f4fa22c82e85e7a119b78d30a1b730eba"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosward-linux-amd64"
        sha256 "04b5b2804bd8e2b93cae267dd8a62b5f4fa22c82e85e7a119b78d30a1b730eba"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosguard-linux-amd64"
        sha256 "055da863f998305e7ada1eada740fb0af972637c9f3c439cdf0ac7bb6709e4aa"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/agent-terminal-linux-amd64"
        sha256 "82471e4824687f3e3ae59f2e9d3ea35df4eaa5d0569113dc03e011f8323460ac"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosterm-linux-amd64"
        sha256 "82471e4824687f3e3ae59f2e9d3ea35df4eaa5d0569113dc03e011f8323460ac"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aos-linux-arm64"
      sha256 "c9507b4bf438c328119c861e87a95438979f49bd91298e920e354cfdb18d21dc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aoscompose-linux-arm64"
        sha256 "c9507b4bf438c328119c861e87a95438979f49bd91298e920e354cfdb18d21dc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosward-linux-arm64"
        sha256 "c9507b4bf438c328119c861e87a95438979f49bd91298e920e354cfdb18d21dc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosguard-linux-arm64"
        sha256 "3047eaff339d9359a778b7930bdb1e720827767e9e16e5c63b7a2bdbbe8a3aa6"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/agent-terminal-linux-arm64"
        sha256 "7233a84a9fde5256147a55c0c8eee6667dcaf56be480193e8f9453753c9bf372"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.222.0/aosterm-linux-arm64"
        sha256 "7233a84a9fde5256147a55c0c8eee6667dcaf56be480193e8f9453753c9bf372"
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
