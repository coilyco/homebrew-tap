class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.149.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aos-darwin-arm64"
      sha256 "635f2f975b5598010c8a6eda1b274f80b0bab4387a1d1d3fd5a200ec64d3e766"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aoscompose-darwin-arm64"
        sha256 "635f2f975b5598010c8a6eda1b274f80b0bab4387a1d1d3fd5a200ec64d3e766"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aosward-darwin-arm64"
        sha256 "635f2f975b5598010c8a6eda1b274f80b0bab4387a1d1d3fd5a200ec64d3e766"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aosguard-darwin-arm64"
        sha256 "b0efb153fe97b287d37ae097bb8cf1983455515639f6be898ba1ee1b9a90a9be"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/agent-terminal-darwin-arm64"
        sha256 "90ba01a7c3e68761707eccccfd09143edee888d492a372ffe58b2197a5e19647"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aos-linux-amd64"
      sha256 "56e1df8f65ce82987139f8200435622f9c84b39f365b5d2c3e49a68fc42ea47d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aoscompose-linux-amd64"
        sha256 "56e1df8f65ce82987139f8200435622f9c84b39f365b5d2c3e49a68fc42ea47d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aosward-linux-amd64"
        sha256 "56e1df8f65ce82987139f8200435622f9c84b39f365b5d2c3e49a68fc42ea47d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aosguard-linux-amd64"
        sha256 "e527dfb5f3c51d598ea515ee181a56f98297f029f52a978363a7236b573c4dca"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/agent-terminal-linux-amd64"
        sha256 "94d6148fe9ddaee2a9d0fb30f080cd6156856ae396c49b9221e377f80bd2984d"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aos-linux-arm64"
      sha256 "ed6f22e4cbcb13ce528119936f5ce1a9642bfeb12e5c4934a37525da3fd0d00f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aoscompose-linux-arm64"
        sha256 "ed6f22e4cbcb13ce528119936f5ce1a9642bfeb12e5c4934a37525da3fd0d00f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aosward-linux-arm64"
        sha256 "ed6f22e4cbcb13ce528119936f5ce1a9642bfeb12e5c4934a37525da3fd0d00f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/aosguard-linux-arm64"
        sha256 "3b0e250d9e7f303d97196d6711a984e222722c41a77587b449575de8cf085f7a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.149.0/agent-terminal-linux-arm64"
        sha256 "bf6eea3e983c69c467d83f33957e2edf32b96a0a240de3822f7302fe254d4a32"
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
