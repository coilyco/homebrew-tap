class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.196.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aos-darwin-arm64"
      sha256 "af87e852edd23bbb5cedb1b594ea45c3078d8858a713c3d4f740e8b5ebbcd1ff"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aoscompose-darwin-arm64"
        sha256 "af87e852edd23bbb5cedb1b594ea45c3078d8858a713c3d4f740e8b5ebbcd1ff"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosward-darwin-arm64"
        sha256 "af87e852edd23bbb5cedb1b594ea45c3078d8858a713c3d4f740e8b5ebbcd1ff"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosguard-darwin-arm64"
        sha256 "c4d66060b94446520a6a722695c6766063fb4d28aefd2f11ba975c5ba3589afd"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/agent-terminal-darwin-arm64"
        sha256 "54c73314ea241c5d8f9bb96e54b44d12b26b2b9c0977d7ab3274f09e9a4a8a48"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosterm-darwin-arm64"
        sha256 "54c73314ea241c5d8f9bb96e54b44d12b26b2b9c0977d7ab3274f09e9a4a8a48"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aos-linux-amd64"
      sha256 "5f4f0c889470c225851534ebc96490a5456b695f8db33ff41b917a1530e3ff8e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aoscompose-linux-amd64"
        sha256 "5f4f0c889470c225851534ebc96490a5456b695f8db33ff41b917a1530e3ff8e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosward-linux-amd64"
        sha256 "5f4f0c889470c225851534ebc96490a5456b695f8db33ff41b917a1530e3ff8e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosguard-linux-amd64"
        sha256 "3e3ad8f6279dcabaee3124b78121d8453ba76196ade946a8cac151888164d9c3"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/agent-terminal-linux-amd64"
        sha256 "915c5f4cc9637b49662b6a28c0ae3a3179f746ec94d7b0943e0a2b0968f4ccc2"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosterm-linux-amd64"
        sha256 "915c5f4cc9637b49662b6a28c0ae3a3179f746ec94d7b0943e0a2b0968f4ccc2"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aos-linux-arm64"
      sha256 "9a52b45aca9ccfbd6951db1d55d96e73edaddc18cef0b50e58c9c69298783217"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aoscompose-linux-arm64"
        sha256 "9a52b45aca9ccfbd6951db1d55d96e73edaddc18cef0b50e58c9c69298783217"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosward-linux-arm64"
        sha256 "9a52b45aca9ccfbd6951db1d55d96e73edaddc18cef0b50e58c9c69298783217"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosguard-linux-arm64"
        sha256 "76440ebb6822e06fdfa994642cc84c6dc972e6e1754dc582e3d09f34bfa6295c"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/agent-terminal-linux-arm64"
        sha256 "c32ffcca693ba1cc0bb11ecd7ce423a5c46244e8a3808f9a7df28b2602e25207"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.196.0/aosterm-linux-arm64"
        sha256 "c32ffcca693ba1cc0bb11ecd7ce423a5c46244e8a3808f9a7df28b2602e25207"
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
