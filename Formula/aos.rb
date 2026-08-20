class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.215.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aos-darwin-arm64"
      sha256 "81ec37453019758e2586b2dea4b9100079c779c5d0398f4929d4b7ce7fe8b076"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aoscompose-darwin-arm64"
        sha256 "81ec37453019758e2586b2dea4b9100079c779c5d0398f4929d4b7ce7fe8b076"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosward-darwin-arm64"
        sha256 "81ec37453019758e2586b2dea4b9100079c779c5d0398f4929d4b7ce7fe8b076"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosguard-darwin-arm64"
        sha256 "317921f9d251eedd618833c3213598a9d1119f4b692ffe1fa7b9fa3b4aa04bf3"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/agent-terminal-darwin-arm64"
        sha256 "12f58f4ae12afe6a4258b22cbae50754f934bbaefd62bb9b23d8f83f1897ce08"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosterm-darwin-arm64"
        sha256 "12f58f4ae12afe6a4258b22cbae50754f934bbaefd62bb9b23d8f83f1897ce08"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aos-linux-amd64"
      sha256 "4e176ed371b43111965c6bd713d176561a5751ccf7631a9a99fa69319e7e6483"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aoscompose-linux-amd64"
        sha256 "4e176ed371b43111965c6bd713d176561a5751ccf7631a9a99fa69319e7e6483"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosward-linux-amd64"
        sha256 "4e176ed371b43111965c6bd713d176561a5751ccf7631a9a99fa69319e7e6483"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosguard-linux-amd64"
        sha256 "0776cf159ff5eaaac19d041759ad7f7ec8e973ace5e6b340bf669cbc68b49a10"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/agent-terminal-linux-amd64"
        sha256 "411f136ac030850b9ff743fe3ea7baf5ad4c7c0af3edb786d26278468a3bf04e"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosterm-linux-amd64"
        sha256 "411f136ac030850b9ff743fe3ea7baf5ad4c7c0af3edb786d26278468a3bf04e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aos-linux-arm64"
      sha256 "47acb1ffba1de3a88f7e3aed2eb42098d755119a54f30e2b4e0445cbd6334cf5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aoscompose-linux-arm64"
        sha256 "47acb1ffba1de3a88f7e3aed2eb42098d755119a54f30e2b4e0445cbd6334cf5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosward-linux-arm64"
        sha256 "47acb1ffba1de3a88f7e3aed2eb42098d755119a54f30e2b4e0445cbd6334cf5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosguard-linux-arm64"
        sha256 "2e6a8849fccac9cb5c789d733d630b1985d1b2d522ac7e59ac1367e0a65e01ab"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/agent-terminal-linux-arm64"
        sha256 "5125a06a542b815c380e1752db438f38c05b24bfb599ff3da07e58e6b75ddf37"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.215.0/aosterm-linux-arm64"
        sha256 "5125a06a542b815c380e1752db438f38c05b24bfb599ff3da07e58e6b75ddf37"
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
