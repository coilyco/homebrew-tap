class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.174.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aos-darwin-arm64"
      sha256 "df35a74742caef0cebe47eabedbd3e4b2ec868d10325564cec3716fc7a490e14"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aoscompose-darwin-arm64"
        sha256 "df35a74742caef0cebe47eabedbd3e4b2ec868d10325564cec3716fc7a490e14"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosward-darwin-arm64"
        sha256 "df35a74742caef0cebe47eabedbd3e4b2ec868d10325564cec3716fc7a490e14"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosguard-darwin-arm64"
        sha256 "52be26853f4d2cd38f568c729909bf10b65233bac2c6f5e0708dfacdb5642f8b"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/agent-terminal-darwin-arm64"
        sha256 "a90ae7d492d658f01ee09bd8401cdaecef2d4f578ffb611ed11aab44f6a04652"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosterm-darwin-arm64"
        sha256 "a90ae7d492d658f01ee09bd8401cdaecef2d4f578ffb611ed11aab44f6a04652"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aos-linux-amd64"
      sha256 "0375d4abe0c56e92ce336aef082aa5dd7ad6da830fe346333547c712cf36491d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aoscompose-linux-amd64"
        sha256 "0375d4abe0c56e92ce336aef082aa5dd7ad6da830fe346333547c712cf36491d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosward-linux-amd64"
        sha256 "0375d4abe0c56e92ce336aef082aa5dd7ad6da830fe346333547c712cf36491d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosguard-linux-amd64"
        sha256 "78de4268598a26674d70b45fdb0f9dd126d6e503aef49425ebf6cb587ff9ffe9"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/agent-terminal-linux-amd64"
        sha256 "f8a0c32b7a62f7ad1143e1e8a4e60d3099dfe799c8de173b04d22ccd58e49a43"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosterm-linux-amd64"
        sha256 "f8a0c32b7a62f7ad1143e1e8a4e60d3099dfe799c8de173b04d22ccd58e49a43"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aos-linux-arm64"
      sha256 "ac36cfcf3a0e890c037212b5574ea2680a668d0a1d668aa3d50071b1f0f8c3eb"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aoscompose-linux-arm64"
        sha256 "ac36cfcf3a0e890c037212b5574ea2680a668d0a1d668aa3d50071b1f0f8c3eb"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosward-linux-arm64"
        sha256 "ac36cfcf3a0e890c037212b5574ea2680a668d0a1d668aa3d50071b1f0f8c3eb"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosguard-linux-arm64"
        sha256 "066bf35363e986a32d2f147c4996716a4f9c82bf3f5cc07eedff23a18672805a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/agent-terminal-linux-arm64"
        sha256 "cc0346ed4c16cf51ba4785a1f01e3e6c513424217f21b75d07e78902c3a8f262"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.174.0/aosterm-linux-arm64"
        sha256 "cc0346ed4c16cf51ba4785a1f01e3e6c513424217f21b75d07e78902c3a8f262"
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
