class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.167.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aos-darwin-arm64"
      sha256 "e7db5213bbbfd1098052302b32518708e24713eadd65f978c307f2c8ae6629bd"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aoscompose-darwin-arm64"
        sha256 "e7db5213bbbfd1098052302b32518708e24713eadd65f978c307f2c8ae6629bd"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aosward-darwin-arm64"
        sha256 "e7db5213bbbfd1098052302b32518708e24713eadd65f978c307f2c8ae6629bd"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aosguard-darwin-arm64"
        sha256 "bc2a3a3ac1fceab1f2083f00b60a658182a24f759a71b52e1900c40cc1eb594c"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/agent-terminal-darwin-arm64"
        sha256 "ae900c4a21b593b7e635ead77dc18fc31bd35a60722ce450dd8fce59b76cc46f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aos-linux-amd64"
      sha256 "7c601263533901533db7f0bff1d404835ec1f9a29138201cf641b644287c2f13"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aoscompose-linux-amd64"
        sha256 "7c601263533901533db7f0bff1d404835ec1f9a29138201cf641b644287c2f13"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aosward-linux-amd64"
        sha256 "7c601263533901533db7f0bff1d404835ec1f9a29138201cf641b644287c2f13"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aosguard-linux-amd64"
        sha256 "979ed53cd41160e6f4e4655bb354acb740d6b4af254f73bdaea3f29275581862"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/agent-terminal-linux-amd64"
        sha256 "156fcb0f3f3ca56104b20d7e3cbd999cc6df4a497d6df5ddb3e5416599c3ad96"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aos-linux-arm64"
      sha256 "a92e7d28cace28d9f5ff1be2cf453052959ea405eb74ec8fa2ad0d7a89633bbb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aoscompose-linux-arm64"
        sha256 "a92e7d28cace28d9f5ff1be2cf453052959ea405eb74ec8fa2ad0d7a89633bbb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aosward-linux-arm64"
        sha256 "a92e7d28cace28d9f5ff1be2cf453052959ea405eb74ec8fa2ad0d7a89633bbb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/aosguard-linux-arm64"
        sha256 "cb84fa67def69e4527314cc88dc35c61b428facfb2051549f28d4fb40d74b1a1"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.167.0/agent-terminal-linux-arm64"
        sha256 "b2808a33cea18eaf9b6731feea97ab7533b08cd5c14b7a503898e45babd4b28a"
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
