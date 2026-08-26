class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.231.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aos-darwin-arm64"
      sha256 "76012c11fa0f4e5282f028ee557205a70c42eeaedef4589fd78b651b442972ff"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aoscompose-darwin-arm64"
        sha256 "76012c11fa0f4e5282f028ee557205a70c42eeaedef4589fd78b651b442972ff"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aosward-darwin-arm64"
        sha256 "76012c11fa0f4e5282f028ee557205a70c42eeaedef4589fd78b651b442972ff"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aosguard-darwin-arm64"
        sha256 "5ffe0644022f71d664b31dc871e5ab4ba42f721136e431765955791af189bba5"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aterm-darwin-arm64"
        sha256 "bb42a84b97099dd01e41fc290214be9272249aca99b85615dcb92ebeb9e7c440"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aos-linux-amd64"
      sha256 "e66b09a61a7a4fdd2d1c292fb865b093fde76a2f7d4f3fe668e473cb10bd9d49"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aoscompose-linux-amd64"
        sha256 "e66b09a61a7a4fdd2d1c292fb865b093fde76a2f7d4f3fe668e473cb10bd9d49"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aosward-linux-amd64"
        sha256 "e66b09a61a7a4fdd2d1c292fb865b093fde76a2f7d4f3fe668e473cb10bd9d49"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aosguard-linux-amd64"
        sha256 "0c283c0540b02b34cf222f60ebddf3b567bf523db4e27720f7822012de6fe1c4"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aterm-linux-amd64"
        sha256 "baf78fac1e1a6eb84a93642765975ea5a79ec2ff982422a12c7871a404d944d8"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aos-linux-arm64"
      sha256 "9e7f00df7b65157b50bcc63c4e263828ba2dffbc1db709c912cdcbea1b7dd271"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aoscompose-linux-arm64"
        sha256 "9e7f00df7b65157b50bcc63c4e263828ba2dffbc1db709c912cdcbea1b7dd271"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aosward-linux-arm64"
        sha256 "9e7f00df7b65157b50bcc63c4e263828ba2dffbc1db709c912cdcbea1b7dd271"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aosguard-linux-arm64"
        sha256 "546b6d71c50d3a9acad8dcd17e1e4b9f2b9cde8eeae3f52c543f173fee6376b6"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.231.0/aterm-linux-arm64"
        sha256 "29429ec21802f92918f973e547dfe912e25a98f8708afe802b6bd5b183bd4bf3"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
