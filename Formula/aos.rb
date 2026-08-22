class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.217.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aos-darwin-arm64"
      sha256 "d72f1fb907c55148976ad4b8a2a3af22f491d75f1849d253b53dec06138f066a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aoscompose-darwin-arm64"
        sha256 "d72f1fb907c55148976ad4b8a2a3af22f491d75f1849d253b53dec06138f066a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosward-darwin-arm64"
        sha256 "d72f1fb907c55148976ad4b8a2a3af22f491d75f1849d253b53dec06138f066a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosguard-darwin-arm64"
        sha256 "7cfc857d69394db64c96f703926d415c9797e4f07583bb212167404426aedaee"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/agent-terminal-darwin-arm64"
        sha256 "ebb23f19612609d7dc45ec5465c6388c714d304b09bc84c85a2e0c2564b0166b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosterm-darwin-arm64"
        sha256 "ebb23f19612609d7dc45ec5465c6388c714d304b09bc84c85a2e0c2564b0166b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aos-linux-amd64"
      sha256 "525ab7e756a1edd20d558c8df54e6f334f7b9744bae5150a1691bd2625676baa"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aoscompose-linux-amd64"
        sha256 "525ab7e756a1edd20d558c8df54e6f334f7b9744bae5150a1691bd2625676baa"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosward-linux-amd64"
        sha256 "525ab7e756a1edd20d558c8df54e6f334f7b9744bae5150a1691bd2625676baa"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosguard-linux-amd64"
        sha256 "bace6c9e7cab1013072658cf045351a5ed1e61063d88bcf281e82d500152e8c1"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/agent-terminal-linux-amd64"
        sha256 "9488dda8fa6a87f3996e692053befe476ac75a53f64d4ea418b07643c3ee9b9c"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosterm-linux-amd64"
        sha256 "9488dda8fa6a87f3996e692053befe476ac75a53f64d4ea418b07643c3ee9b9c"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aos-linux-arm64"
      sha256 "6cfc49c6a792d0f970a374e67176d8a31f4c7db731d3dc0f4ebd9c4b0d4e23af"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aoscompose-linux-arm64"
        sha256 "6cfc49c6a792d0f970a374e67176d8a31f4c7db731d3dc0f4ebd9c4b0d4e23af"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosward-linux-arm64"
        sha256 "6cfc49c6a792d0f970a374e67176d8a31f4c7db731d3dc0f4ebd9c4b0d4e23af"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosguard-linux-arm64"
        sha256 "d679aca81753d11ac2c73315dcc3051f0b23e79332d808ab2c0002cd20c56464"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/agent-terminal-linux-arm64"
        sha256 "4013bdc823e15e54c48679f653fc7414c082d0e465318f1524bc8377b04c9f21"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.217.0/aosterm-linux-arm64"
        sha256 "4013bdc823e15e54c48679f653fc7414c082d0e465318f1524bc8377b04c9f21"
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
