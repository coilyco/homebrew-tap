class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.187.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aos-darwin-arm64"
      sha256 "44a82f7d79a167b27d9e2e2bed835b25242541a5b09a1d590a82b8d2eec3fbdf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aoscompose-darwin-arm64"
        sha256 "44a82f7d79a167b27d9e2e2bed835b25242541a5b09a1d590a82b8d2eec3fbdf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosward-darwin-arm64"
        sha256 "44a82f7d79a167b27d9e2e2bed835b25242541a5b09a1d590a82b8d2eec3fbdf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosguard-darwin-arm64"
        sha256 "c0c2a46a39511f40b4613f66bc550ffead36512da8178bdc87d0f51a81538d3b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/agent-terminal-darwin-arm64"
        sha256 "379bdce75ebc6e23147731be83b93fa1e4c654859621afe524c89c70a25b8f6c"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosterm-darwin-arm64"
        sha256 "379bdce75ebc6e23147731be83b93fa1e4c654859621afe524c89c70a25b8f6c"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aos-linux-amd64"
      sha256 "2cf1d4971e757aab9a254ee634c00efae1be3435bd57d067d18574b6e6d33bf9"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aoscompose-linux-amd64"
        sha256 "2cf1d4971e757aab9a254ee634c00efae1be3435bd57d067d18574b6e6d33bf9"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosward-linux-amd64"
        sha256 "2cf1d4971e757aab9a254ee634c00efae1be3435bd57d067d18574b6e6d33bf9"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosguard-linux-amd64"
        sha256 "e8899c4417bea35d8f65200b2e96fe1f7d3b7c7f126f1e402fc9ad42044252d0"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/agent-terminal-linux-amd64"
        sha256 "bf8e2d78f227e269ff68f3eb516a5cbadb63193c197d3e8e43237f472305eb7e"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosterm-linux-amd64"
        sha256 "bf8e2d78f227e269ff68f3eb516a5cbadb63193c197d3e8e43237f472305eb7e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aos-linux-arm64"
      sha256 "8cf3cf344f454a6dc4a764e3f98feee8e0916df4fe68b927c6bf996a46daf15b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aoscompose-linux-arm64"
        sha256 "8cf3cf344f454a6dc4a764e3f98feee8e0916df4fe68b927c6bf996a46daf15b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosward-linux-arm64"
        sha256 "8cf3cf344f454a6dc4a764e3f98feee8e0916df4fe68b927c6bf996a46daf15b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosguard-linux-arm64"
        sha256 "406aecf35ca5963a8f92d1eadee88eae12bafcb00ac08b66c8a4dbe4dab2a6ef"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/agent-terminal-linux-arm64"
        sha256 "8dbb50eae6d28c221025462bef00f448775f5e36fcae78f5143d6160859559d9"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.187.0/aosterm-linux-arm64"
        sha256 "8dbb50eae6d28c221025462bef00f448775f5e36fcae78f5143d6160859559d9"
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
