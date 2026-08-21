class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.216.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aos-darwin-arm64"
      sha256 "c09d41336dd66c5fc3a52daeed05e3bdb3e827d7923f4bde35ec2c2423146174"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aoscompose-darwin-arm64"
        sha256 "c09d41336dd66c5fc3a52daeed05e3bdb3e827d7923f4bde35ec2c2423146174"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosward-darwin-arm64"
        sha256 "c09d41336dd66c5fc3a52daeed05e3bdb3e827d7923f4bde35ec2c2423146174"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosguard-darwin-arm64"
        sha256 "b48fbaaed6870953b622346ae64bfd65df5eb20c9a1a0ee8db53fe4420b7b1da"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/agent-terminal-darwin-arm64"
        sha256 "5e19e0a8b83dd60f7125111de26393036ec295dd06eee28f2f70b2c49ccbcb48"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosterm-darwin-arm64"
        sha256 "5e19e0a8b83dd60f7125111de26393036ec295dd06eee28f2f70b2c49ccbcb48"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aos-linux-amd64"
      sha256 "314e9a89064354157092f0676b8b7973498ba351786d322167f2bd6cd30bdadc"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aoscompose-linux-amd64"
        sha256 "314e9a89064354157092f0676b8b7973498ba351786d322167f2bd6cd30bdadc"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosward-linux-amd64"
        sha256 "314e9a89064354157092f0676b8b7973498ba351786d322167f2bd6cd30bdadc"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosguard-linux-amd64"
        sha256 "f5eaad3d066b6d399b39628504ac0d562f1060a0b046f5119d9759d24cbaabdc"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/agent-terminal-linux-amd64"
        sha256 "49d1f0eb0f53574d6e908f97390018b071d8123db8072c8fc6c8a6899a84d77a"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosterm-linux-amd64"
        sha256 "49d1f0eb0f53574d6e908f97390018b071d8123db8072c8fc6c8a6899a84d77a"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aos-linux-arm64"
      sha256 "f6d152a6a112f8814e12126037edd806454c7c2c3cd3122d54f388a61436ec29"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aoscompose-linux-arm64"
        sha256 "f6d152a6a112f8814e12126037edd806454c7c2c3cd3122d54f388a61436ec29"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosward-linux-arm64"
        sha256 "f6d152a6a112f8814e12126037edd806454c7c2c3cd3122d54f388a61436ec29"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosguard-linux-arm64"
        sha256 "62a39d9651f147460f6d8737712f0408fd19ea16ba9ca60e10eb241f4a789855"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/agent-terminal-linux-arm64"
        sha256 "c8242b273b26422058cf14ef3b498d04e63febbe677d5471f13ccfbde619005b"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.216.0/aosterm-linux-arm64"
        sha256 "c8242b273b26422058cf14ef3b498d04e63febbe677d5471f13ccfbde619005b"
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
