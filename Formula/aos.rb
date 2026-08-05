class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.157.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aos-darwin-arm64"
      sha256 "4a328638371f80784a25132dc687e2a07aeb3cf03951d64f0344e3e436ec14d4"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aoscompose-darwin-arm64"
        sha256 "4a328638371f80784a25132dc687e2a07aeb3cf03951d64f0344e3e436ec14d4"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aosward-darwin-arm64"
        sha256 "4a328638371f80784a25132dc687e2a07aeb3cf03951d64f0344e3e436ec14d4"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aosguard-darwin-arm64"
        sha256 "2f8c8250a2a3b51321247311477f01180b4d60158d7af39f86cb025e2bb960f8"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/agent-terminal-darwin-arm64"
        sha256 "bda8994512c9e60b403bdf5dc10e309fdda562013590a4692b6cac60bc3a9c19"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aos-linux-amd64"
      sha256 "554cba91f276034cfa04d49a4dba6205cc9e8946d659cf054a550af14dc951d1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aoscompose-linux-amd64"
        sha256 "554cba91f276034cfa04d49a4dba6205cc9e8946d659cf054a550af14dc951d1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aosward-linux-amd64"
        sha256 "554cba91f276034cfa04d49a4dba6205cc9e8946d659cf054a550af14dc951d1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aosguard-linux-amd64"
        sha256 "ddd91015da0db13038a409276fee4b53a5503a6c353398a5134eaf8831ebf918"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/agent-terminal-linux-amd64"
        sha256 "9a0ccd8a8307b8843d5935e6e6c8b084fe239d94800659f260399fcc9790083e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aos-linux-arm64"
      sha256 "d06b4bfdc0ba8e1b7ee17d227946c309f24d2db46d099cae86ba1c3b918a791a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aoscompose-linux-arm64"
        sha256 "d06b4bfdc0ba8e1b7ee17d227946c309f24d2db46d099cae86ba1c3b918a791a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aosward-linux-arm64"
        sha256 "d06b4bfdc0ba8e1b7ee17d227946c309f24d2db46d099cae86ba1c3b918a791a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/aosguard-linux-arm64"
        sha256 "41409f6beaf6a49ed0b9c69d2687316b669d5b8a60d30919b7337d0f22135749"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.157.0/agent-terminal-linux-arm64"
        sha256 "139341fe7769eb2062969f7261d58c8e46b965520549e08f4af0b073f148abb4"
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
