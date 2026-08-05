class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.165.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aos-darwin-arm64"
      sha256 "ca29543418432b545ce3c22b04a8e330bc041de0da935a6b451dc3b81170565d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aoscompose-darwin-arm64"
        sha256 "ca29543418432b545ce3c22b04a8e330bc041de0da935a6b451dc3b81170565d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aosward-darwin-arm64"
        sha256 "ca29543418432b545ce3c22b04a8e330bc041de0da935a6b451dc3b81170565d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aosguard-darwin-arm64"
        sha256 "4eb2af77c28dfb8e6fc1c939ef08f36d173fb841bbd53314892ad71ff21bdfdf"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/agent-terminal-darwin-arm64"
        sha256 "0528beb48e9fad4b2c5da322fd08105c18e282f9079040c624f611f83faef3a4"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aos-linux-amd64"
      sha256 "17f96b728db29fb4f0952e6c42bb2112f5060098a035be844a7d315e4cec24e2"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aoscompose-linux-amd64"
        sha256 "17f96b728db29fb4f0952e6c42bb2112f5060098a035be844a7d315e4cec24e2"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aosward-linux-amd64"
        sha256 "17f96b728db29fb4f0952e6c42bb2112f5060098a035be844a7d315e4cec24e2"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aosguard-linux-amd64"
        sha256 "66a232a17b9504d2c2c6ff1ec34fb65046984141d593467a405bb26d8d498ebc"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/agent-terminal-linux-amd64"
        sha256 "4831af9aaf6e3bf5f80a22de2df00c904b9dc1e40d75bdcbc3e8243580224a62"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aos-linux-arm64"
      sha256 "12ef08f810f8480451897201e0e001c16a792d224a37420e139d45b6a0233672"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aoscompose-linux-arm64"
        sha256 "12ef08f810f8480451897201e0e001c16a792d224a37420e139d45b6a0233672"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aosward-linux-arm64"
        sha256 "12ef08f810f8480451897201e0e001c16a792d224a37420e139d45b6a0233672"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/aosguard-linux-arm64"
        sha256 "6948f2f1b0848a97a42c526932bb73bc01e1b94933e27c7b7d7816ab98c66c63"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.165.0/agent-terminal-linux-arm64"
        sha256 "0833933704967690d2894eda79653f969088f6b92cf3b78b2299f0cf08d8bd96"
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
