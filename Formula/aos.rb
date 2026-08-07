class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.186.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aos-darwin-arm64"
      sha256 "af2643a6f843da22e0e93b25fe2b4ec7611af76ecd1262e76fbbee94657adbbb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aoscompose-darwin-arm64"
        sha256 "af2643a6f843da22e0e93b25fe2b4ec7611af76ecd1262e76fbbee94657adbbb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosward-darwin-arm64"
        sha256 "af2643a6f843da22e0e93b25fe2b4ec7611af76ecd1262e76fbbee94657adbbb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosguard-darwin-arm64"
        sha256 "0c62d6b2f1311da77fa29db7ffbfe354f2a567cdbe42fbf0abf1687169de3b98"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/agent-terminal-darwin-arm64"
        sha256 "7fef06dae9880eccf420b08f58740d7d81cfba3bb6c4d8e9d9469a8bff2582e2"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosterm-darwin-arm64"
        sha256 "7fef06dae9880eccf420b08f58740d7d81cfba3bb6c4d8e9d9469a8bff2582e2"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aos-linux-amd64"
      sha256 "3a63e020e8361118ea215196032ff73cfc24d8b6c403dd22a55ca8ae1dca891b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aoscompose-linux-amd64"
        sha256 "3a63e020e8361118ea215196032ff73cfc24d8b6c403dd22a55ca8ae1dca891b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosward-linux-amd64"
        sha256 "3a63e020e8361118ea215196032ff73cfc24d8b6c403dd22a55ca8ae1dca891b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosguard-linux-amd64"
        sha256 "c7487b21359c4105bd8ade5f28493b2fa24c63a3510db64b6eb044e7591cad20"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/agent-terminal-linux-amd64"
        sha256 "97e48051ef2939d1f08e814ca4fe6b6cd8cdcec10c45638ccd07d5693a2bec03"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosterm-linux-amd64"
        sha256 "97e48051ef2939d1f08e814ca4fe6b6cd8cdcec10c45638ccd07d5693a2bec03"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aos-linux-arm64"
      sha256 "4617a4dd2f435d31fcc2f447efb8d063227bf8a5c36b14bbfe75daf0bd5b61a5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aoscompose-linux-arm64"
        sha256 "4617a4dd2f435d31fcc2f447efb8d063227bf8a5c36b14bbfe75daf0bd5b61a5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosward-linux-arm64"
        sha256 "4617a4dd2f435d31fcc2f447efb8d063227bf8a5c36b14bbfe75daf0bd5b61a5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosguard-linux-arm64"
        sha256 "a4f164a7c1e6ec801b22bda23b5245a622d1445e0554e10147bc73a195451924"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/agent-terminal-linux-arm64"
        sha256 "f160ebd69b4ff8334fa1fb7d9f3d82131a0ef6daa4b9ec31d228c68866408fdc"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.186.0/aosterm-linux-arm64"
        sha256 "f160ebd69b4ff8334fa1fb7d9f3d82131a0ef6daa4b9ec31d228c68866408fdc"
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
