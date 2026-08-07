class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.188.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aos-darwin-arm64"
      sha256 "c50be4514f5433efc70882d1325a8c075801bde3157aef685c60436d769a339f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aoscompose-darwin-arm64"
        sha256 "c50be4514f5433efc70882d1325a8c075801bde3157aef685c60436d769a339f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosward-darwin-arm64"
        sha256 "c50be4514f5433efc70882d1325a8c075801bde3157aef685c60436d769a339f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosguard-darwin-arm64"
        sha256 "88e1cc381cdcbad98e929645d15c453af60a2be2923e3207bf162170e8e5815a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/agent-terminal-darwin-arm64"
        sha256 "c07db2b30af13f0c5351f0414587405317657e8570e6621366b3cbbc2cd60d0f"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosterm-darwin-arm64"
        sha256 "c07db2b30af13f0c5351f0414587405317657e8570e6621366b3cbbc2cd60d0f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aos-linux-amd64"
      sha256 "300e6e080148ff0e21c1633eb526f74e3d59d1556638115a2757a0dcfbb8cfc5"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aoscompose-linux-amd64"
        sha256 "300e6e080148ff0e21c1633eb526f74e3d59d1556638115a2757a0dcfbb8cfc5"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosward-linux-amd64"
        sha256 "300e6e080148ff0e21c1633eb526f74e3d59d1556638115a2757a0dcfbb8cfc5"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosguard-linux-amd64"
        sha256 "9a4ec6556ed0048edaebd608ff21dd8deebd404f0335287715e9097ba653fd24"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/agent-terminal-linux-amd64"
        sha256 "c6abdf7f05e0e5af5ce8d82b9afaee5bd201a60bacdfa25de020fcc13075336b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosterm-linux-amd64"
        sha256 "c6abdf7f05e0e5af5ce8d82b9afaee5bd201a60bacdfa25de020fcc13075336b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aos-linux-arm64"
      sha256 "46a8fecc2a7f1aadadcf597bb2526339f40ea43d2c82d8a0d925d9743170513c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aoscompose-linux-arm64"
        sha256 "46a8fecc2a7f1aadadcf597bb2526339f40ea43d2c82d8a0d925d9743170513c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosward-linux-arm64"
        sha256 "46a8fecc2a7f1aadadcf597bb2526339f40ea43d2c82d8a0d925d9743170513c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosguard-linux-arm64"
        sha256 "6942268e5261bc3a94110b5674d65f844a2430c8e96acf86b61edd9ad76e29d4"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/agent-terminal-linux-arm64"
        sha256 "a0448c7d5647dd2bde725ad1f3dc1473e997d740f6b9c277e9aba7b498a8664a"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.188.0/aosterm-linux-arm64"
        sha256 "a0448c7d5647dd2bde725ad1f3dc1473e997d740f6b9c277e9aba7b498a8664a"
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
