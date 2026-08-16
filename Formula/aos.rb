class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.211.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aos-darwin-arm64"
      sha256 "51ba68aeeb7b2b246026abea6478fdbabd3c948ba97a8ed0e60449faa1ec6792"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aoscompose-darwin-arm64"
        sha256 "51ba68aeeb7b2b246026abea6478fdbabd3c948ba97a8ed0e60449faa1ec6792"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosward-darwin-arm64"
        sha256 "51ba68aeeb7b2b246026abea6478fdbabd3c948ba97a8ed0e60449faa1ec6792"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosguard-darwin-arm64"
        sha256 "52f8beb88851bce724d1f307028587a1082906ae43e6dce936e0ab7b6adc701d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/agent-terminal-darwin-arm64"
        sha256 "601e087b4c4bf29169751e3caaf5928780e5f5ed76ad81460ba454653ef6cc15"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosterm-darwin-arm64"
        sha256 "601e087b4c4bf29169751e3caaf5928780e5f5ed76ad81460ba454653ef6cc15"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aos-linux-amd64"
      sha256 "2f42390a59c4a1fd354c14c6256a2cf37e02e5c9b5f5d6ec0f24e34dff11a302"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aoscompose-linux-amd64"
        sha256 "2f42390a59c4a1fd354c14c6256a2cf37e02e5c9b5f5d6ec0f24e34dff11a302"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosward-linux-amd64"
        sha256 "2f42390a59c4a1fd354c14c6256a2cf37e02e5c9b5f5d6ec0f24e34dff11a302"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosguard-linux-amd64"
        sha256 "190c4892085d40f1add2726a30f2db73335a3a6f47c1adf701c294b9f1e81651"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/agent-terminal-linux-amd64"
        sha256 "8b549738eb66b09e6ba45a2ad7790bcfe3eed46ba32dc80e80e3b30fdad6aded"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosterm-linux-amd64"
        sha256 "8b549738eb66b09e6ba45a2ad7790bcfe3eed46ba32dc80e80e3b30fdad6aded"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aos-linux-arm64"
      sha256 "63d511a58b25b4dc4d7974c7505cad82e952ca7387b634e53f2f932f85dcd333"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aoscompose-linux-arm64"
        sha256 "63d511a58b25b4dc4d7974c7505cad82e952ca7387b634e53f2f932f85dcd333"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosward-linux-arm64"
        sha256 "63d511a58b25b4dc4d7974c7505cad82e952ca7387b634e53f2f932f85dcd333"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosguard-linux-arm64"
        sha256 "755f6a1b57e2ab97c2737cea52760a93cab5590a524868f448998aeff0e7236a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/agent-terminal-linux-arm64"
        sha256 "01cbf2b6506198fb9fb03bbd642528dd08241b017eac5a378fed0a04036c4a10"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.211.0/aosterm-linux-arm64"
        sha256 "01cbf2b6506198fb9fb03bbd642528dd08241b017eac5a378fed0a04036c4a10"
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
