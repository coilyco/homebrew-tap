class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.212.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aos-darwin-arm64"
      sha256 "3dfcffb6a8485303e055789b47c79073a9f0c0d91853146c32eefcb7e7ae1375"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aoscompose-darwin-arm64"
        sha256 "3dfcffb6a8485303e055789b47c79073a9f0c0d91853146c32eefcb7e7ae1375"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosward-darwin-arm64"
        sha256 "3dfcffb6a8485303e055789b47c79073a9f0c0d91853146c32eefcb7e7ae1375"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosguard-darwin-arm64"
        sha256 "787b95913ce72dd88380a55a39f1a8e75482bfd165c1e7e74cda3d5a9e3d03a5"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/agent-terminal-darwin-arm64"
        sha256 "4d475414507f4d471cf400ce2fc86ac24a5eb1a75e498579207e227819a51fcb"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosterm-darwin-arm64"
        sha256 "4d475414507f4d471cf400ce2fc86ac24a5eb1a75e498579207e227819a51fcb"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aos-linux-amd64"
      sha256 "d1a1dd56850410fa42333fa28ffe19b90829dbaf3db675ca6148b22049f3ea68"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aoscompose-linux-amd64"
        sha256 "d1a1dd56850410fa42333fa28ffe19b90829dbaf3db675ca6148b22049f3ea68"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosward-linux-amd64"
        sha256 "d1a1dd56850410fa42333fa28ffe19b90829dbaf3db675ca6148b22049f3ea68"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosguard-linux-amd64"
        sha256 "cf550364a44246d03cf13c4fd322e5aed80beadf3003bb86e7ab9151d8f7d99c"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/agent-terminal-linux-amd64"
        sha256 "3aac38faa1b4408ce262396ed35bca8ae49c749602f2ac21f23ce6800d0a942d"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosterm-linux-amd64"
        sha256 "3aac38faa1b4408ce262396ed35bca8ae49c749602f2ac21f23ce6800d0a942d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aos-linux-arm64"
      sha256 "142009defa3dd92324ab3f14ff9dc53db0107ab89549e984062c7e982e284560"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aoscompose-linux-arm64"
        sha256 "142009defa3dd92324ab3f14ff9dc53db0107ab89549e984062c7e982e284560"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosward-linux-arm64"
        sha256 "142009defa3dd92324ab3f14ff9dc53db0107ab89549e984062c7e982e284560"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosguard-linux-arm64"
        sha256 "c7a710fffea0746ca6681bb379c4aaf8b74fbe6efd0b8229834f52b8b5a0357e"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/agent-terminal-linux-arm64"
        sha256 "0785636783e6423d914087df0822a3c97acaf5d4d4c71c258a49b34c908223da"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.212.0/aosterm-linux-arm64"
        sha256 "0785636783e6423d914087df0822a3c97acaf5d4d4c71c258a49b34c908223da"
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
