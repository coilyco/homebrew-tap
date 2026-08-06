class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.176.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aos-darwin-arm64"
      sha256 "0dafb82b06c4b032de7fd4dc39779fc2aa15ebb433bbdfbd0a26e199f4138629"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aoscompose-darwin-arm64"
        sha256 "0dafb82b06c4b032de7fd4dc39779fc2aa15ebb433bbdfbd0a26e199f4138629"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosward-darwin-arm64"
        sha256 "0dafb82b06c4b032de7fd4dc39779fc2aa15ebb433bbdfbd0a26e199f4138629"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosguard-darwin-arm64"
        sha256 "1566eb704b25df8d60aee576df2f99e9454f433b2df423bb535c5bca39af6856"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/agent-terminal-darwin-arm64"
        sha256 "19385a67f6f59db80795409cda80886686e15b5c4c9c12aed3c8c062b847fd57"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosterm-darwin-arm64"
        sha256 "19385a67f6f59db80795409cda80886686e15b5c4c9c12aed3c8c062b847fd57"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aos-linux-amd64"
      sha256 "614c3ba8436cb663a56ac0c3882e64d830dc9811c0e8a387ea0e3959a95f8f4c"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aoscompose-linux-amd64"
        sha256 "614c3ba8436cb663a56ac0c3882e64d830dc9811c0e8a387ea0e3959a95f8f4c"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosward-linux-amd64"
        sha256 "614c3ba8436cb663a56ac0c3882e64d830dc9811c0e8a387ea0e3959a95f8f4c"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosguard-linux-amd64"
        sha256 "4c6fe8dfbca050d60b82451c934618a1287741db8fe77700a6f0e1ec60f41fbc"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/agent-terminal-linux-amd64"
        sha256 "56c42e1cc05e4a45d401f4856c3e14dd18ac6fea459f1f55abc334fd626accc8"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosterm-linux-amd64"
        sha256 "56c42e1cc05e4a45d401f4856c3e14dd18ac6fea459f1f55abc334fd626accc8"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aos-linux-arm64"
      sha256 "115da6645e8341c47808916b66c6e48d6407240f1a5c8df63c2c239c63d877f2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aoscompose-linux-arm64"
        sha256 "115da6645e8341c47808916b66c6e48d6407240f1a5c8df63c2c239c63d877f2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosward-linux-arm64"
        sha256 "115da6645e8341c47808916b66c6e48d6407240f1a5c8df63c2c239c63d877f2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosguard-linux-arm64"
        sha256 "4914c797314a14b472b999974b1707c98bd933c44e568eb1dd9861adc54e49e4"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/agent-terminal-linux-arm64"
        sha256 "17e2beef98d07a8ebd7fdcc23feb29b11dd46e830a159b4bf9944393548c282f"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.176.0/aosterm-linux-arm64"
        sha256 "17e2beef98d07a8ebd7fdcc23feb29b11dd46e830a159b4bf9944393548c282f"
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
