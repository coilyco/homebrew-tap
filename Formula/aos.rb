class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.220.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aos-darwin-arm64"
      sha256 "8fdb2e1fe1ac215e1918e38fd7895d55c8a003a2d5ca7c56d37dd7bb294f6957"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aoscompose-darwin-arm64"
        sha256 "8fdb2e1fe1ac215e1918e38fd7895d55c8a003a2d5ca7c56d37dd7bb294f6957"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosward-darwin-arm64"
        sha256 "8fdb2e1fe1ac215e1918e38fd7895d55c8a003a2d5ca7c56d37dd7bb294f6957"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosguard-darwin-arm64"
        sha256 "c8d5c77e1efc61af7c1d623a86b17239cf9be6008466fe951add283223ea7b19"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/agent-terminal-darwin-arm64"
        sha256 "f3b2d5ce6f76b65c1784040e4996eee8717533493577bd32533e09d0c288e4dc"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosterm-darwin-arm64"
        sha256 "f3b2d5ce6f76b65c1784040e4996eee8717533493577bd32533e09d0c288e4dc"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aos-linux-amd64"
      sha256 "0bc0efaa7a0c9c1cab4d48b10bff6923b060791e47d6f053e02f11d728513fb8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aoscompose-linux-amd64"
        sha256 "0bc0efaa7a0c9c1cab4d48b10bff6923b060791e47d6f053e02f11d728513fb8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosward-linux-amd64"
        sha256 "0bc0efaa7a0c9c1cab4d48b10bff6923b060791e47d6f053e02f11d728513fb8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosguard-linux-amd64"
        sha256 "70c9f9827c029a375122e1a0726ce3ec3307bbebef843c18345fafd12e302e21"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/agent-terminal-linux-amd64"
        sha256 "394f872388ff41dc597c8244104953384cb2c7b5371028f13647beed26dcb9cb"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosterm-linux-amd64"
        sha256 "394f872388ff41dc597c8244104953384cb2c7b5371028f13647beed26dcb9cb"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aos-linux-arm64"
      sha256 "7b89b7638f6b170434a6239f81e22aa0cc403fae780d81253a14b1277c7472ff"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aoscompose-linux-arm64"
        sha256 "7b89b7638f6b170434a6239f81e22aa0cc403fae780d81253a14b1277c7472ff"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosward-linux-arm64"
        sha256 "7b89b7638f6b170434a6239f81e22aa0cc403fae780d81253a14b1277c7472ff"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosguard-linux-arm64"
        sha256 "4f50dc905626b4308c9c299be7b36cc797ba37f9972d886265294033af29783e"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/agent-terminal-linux-arm64"
        sha256 "1da9460015121f0af0886a5937c4600b745544b161b3ebbc292613e3cdac17c1"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.220.0/aosterm-linux-arm64"
        sha256 "1da9460015121f0af0886a5937c4600b745544b161b3ebbc292613e3cdac17c1"
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
