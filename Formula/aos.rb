class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.169.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aos-darwin-arm64"
      sha256 "8b0b98d48e2c1ad43b20021f70a738bc77cf30201b34d4045d4f64a5dc62c358"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aoscompose-darwin-arm64"
        sha256 "8b0b98d48e2c1ad43b20021f70a738bc77cf30201b34d4045d4f64a5dc62c358"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aosward-darwin-arm64"
        sha256 "8b0b98d48e2c1ad43b20021f70a738bc77cf30201b34d4045d4f64a5dc62c358"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aosguard-darwin-arm64"
        sha256 "2b7e714afe6a2985b8de7ae8d1a65e35f862335251a881feb12d9a5370d1db0a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/agent-terminal-darwin-arm64"
        sha256 "3816d46238bbf5b564c8441d8eb2830391f171eb3c893a997b38705b960d1096"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aos-linux-amd64"
      sha256 "ae346815f37055caa30e0a6df9b29e2fc32fbd2d04d40c09f4c655161c5fdb92"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aoscompose-linux-amd64"
        sha256 "ae346815f37055caa30e0a6df9b29e2fc32fbd2d04d40c09f4c655161c5fdb92"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aosward-linux-amd64"
        sha256 "ae346815f37055caa30e0a6df9b29e2fc32fbd2d04d40c09f4c655161c5fdb92"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aosguard-linux-amd64"
        sha256 "800fdf670ce1ae6c2aaf7d0fc0f204a5e9f0832f026d6f35b877bccc859dd83e"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/agent-terminal-linux-amd64"
        sha256 "08f55053a057c3f0e958127dba37d2529b857bdfb96033593b8be4fcbde00af6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aos-linux-arm64"
      sha256 "f68ad74f1fcfa9bb51dab037ee69b21bb3a02f6d245db0c9904d53ab2c130c72"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aoscompose-linux-arm64"
        sha256 "f68ad74f1fcfa9bb51dab037ee69b21bb3a02f6d245db0c9904d53ab2c130c72"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aosward-linux-arm64"
        sha256 "f68ad74f1fcfa9bb51dab037ee69b21bb3a02f6d245db0c9904d53ab2c130c72"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/aosguard-linux-arm64"
        sha256 "33bd956c8bb62dd837cd2c7d23568d5ba7dce5172611af7a37b66ef55372c46d"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.169.0/agent-terminal-linux-arm64"
        sha256 "92610a0bc4a1efbdf6f6e1bb5ca74ee5b299d13f0793ade1ad91b633db516483"
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
