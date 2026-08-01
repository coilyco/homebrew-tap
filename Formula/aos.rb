class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.145.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aos-darwin-arm64"
      sha256 "b8199b0116a28d0b053619df3d5d62290117960823780cdc573435a9c8bf3833"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aoscompose-darwin-arm64"
        sha256 "b8199b0116a28d0b053619df3d5d62290117960823780cdc573435a9c8bf3833"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aosward-darwin-arm64"
        sha256 "b8199b0116a28d0b053619df3d5d62290117960823780cdc573435a9c8bf3833"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aosguard-darwin-arm64"
        sha256 "e767dfc8a77416c55c647e39101629bb8946700f6ceddf31247fbfbb5c033243"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/agent-terminal-darwin-arm64"
        sha256 "895402a0db08a26e0f62fa52e60def41e5e558612cc8a86831a77c06c65412a9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aos-linux-amd64"
      sha256 "0667650acdc66f1fa81656fa906e9a920a5366f3d231debcba25b07ce1fa6861"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aoscompose-linux-amd64"
        sha256 "0667650acdc66f1fa81656fa906e9a920a5366f3d231debcba25b07ce1fa6861"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aosward-linux-amd64"
        sha256 "0667650acdc66f1fa81656fa906e9a920a5366f3d231debcba25b07ce1fa6861"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aosguard-linux-amd64"
        sha256 "23cdb832a0c2f895f2944b39dfc30af9ed87f6f58cccbfb68ec48d841b00e990"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/agent-terminal-linux-amd64"
        sha256 "629f985d0027bb5c5e1d87b88f27358be23da41a72e87ff1c51414720b132fee"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aos-linux-arm64"
      sha256 "a990f7a490c36eaf1e6448d7162abcdd5406aaa2b1fdf611fe6d3dbb409b7269"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aoscompose-linux-arm64"
        sha256 "a990f7a490c36eaf1e6448d7162abcdd5406aaa2b1fdf611fe6d3dbb409b7269"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aosward-linux-arm64"
        sha256 "a990f7a490c36eaf1e6448d7162abcdd5406aaa2b1fdf611fe6d3dbb409b7269"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/aosguard-linux-arm64"
        sha256 "f550cd6f3e54abdefd3424bd98357df6c475834fcd0218b86a9e27d409f8d7cd"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.145.0/agent-terminal-linux-arm64"
        sha256 "5f7987781dd03987a197840c7201ef252c27f12e71ce9bc9a05898901da54d20"
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
