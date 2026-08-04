class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.154.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aos-darwin-arm64"
      sha256 "53b69f4a298bb3259a316f4bf4669b42d7c91b0b1f848facafba550bdf3d5eaf"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aoscompose-darwin-arm64"
        sha256 "53b69f4a298bb3259a316f4bf4669b42d7c91b0b1f848facafba550bdf3d5eaf"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aosward-darwin-arm64"
        sha256 "53b69f4a298bb3259a316f4bf4669b42d7c91b0b1f848facafba550bdf3d5eaf"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aosguard-darwin-arm64"
        sha256 "062a82777054974f9e2e3de31c5fcc7cefd198e10ef5d0de59e9bf0e172d08ca"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/agent-terminal-darwin-arm64"
        sha256 "1dc11be3614be783da6d101bf85a89d5b376c20e26d91223fe16c991adc1b631"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aos-linux-amd64"
      sha256 "4123d5764ff962ff0180c646e45fa2cff89d96de4fd8c60ef37c01b9fb3bb477"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aoscompose-linux-amd64"
        sha256 "4123d5764ff962ff0180c646e45fa2cff89d96de4fd8c60ef37c01b9fb3bb477"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aosward-linux-amd64"
        sha256 "4123d5764ff962ff0180c646e45fa2cff89d96de4fd8c60ef37c01b9fb3bb477"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aosguard-linux-amd64"
        sha256 "cd6d62086926c5745e384a9550005ca9088dfab5c77d6e192fc2a46f7a8e1be9"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/agent-terminal-linux-amd64"
        sha256 "048bb156db8cdee9b324b4ed9d1af3ff0ae1e17edb813907e90cdc77241068ab"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aos-linux-arm64"
      sha256 "40f23626f30abff5d7be2e7eba46ac6678f21abcd532c159cc51076854ded83a"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aoscompose-linux-arm64"
        sha256 "40f23626f30abff5d7be2e7eba46ac6678f21abcd532c159cc51076854ded83a"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aosward-linux-arm64"
        sha256 "40f23626f30abff5d7be2e7eba46ac6678f21abcd532c159cc51076854ded83a"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/aosguard-linux-arm64"
        sha256 "fbe51de8dc14860075befe36a5835d7252ceb71a403e18da02a10ad2c98a40be"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.154.0/agent-terminal-linux-arm64"
        sha256 "0a0e7645110c8796af53b1056717278a4a5258dcef5c1449e691dab554f6c55e"
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
