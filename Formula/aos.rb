class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.189.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aos-darwin-arm64"
      sha256 "652fb5e26300fc3bac0ad83862f33435513509c6708cd49a2760b60597e42c08"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aoscompose-darwin-arm64"
        sha256 "652fb5e26300fc3bac0ad83862f33435513509c6708cd49a2760b60597e42c08"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosward-darwin-arm64"
        sha256 "652fb5e26300fc3bac0ad83862f33435513509c6708cd49a2760b60597e42c08"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosguard-darwin-arm64"
        sha256 "858608926163d00abd86cb0810a6ae8be52d0af2f976922c63001e07e2af4e91"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/agent-terminal-darwin-arm64"
        sha256 "c8a363244780935e66c767df092a7a815d4338ab8fa8201cb0f903064b7250d5"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosterm-darwin-arm64"
        sha256 "c8a363244780935e66c767df092a7a815d4338ab8fa8201cb0f903064b7250d5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aos-linux-amd64"
      sha256 "82dab7478f799ff198276d1177b8ae40679f5a656a481a7d4e3e8a35a63a65f7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aoscompose-linux-amd64"
        sha256 "82dab7478f799ff198276d1177b8ae40679f5a656a481a7d4e3e8a35a63a65f7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosward-linux-amd64"
        sha256 "82dab7478f799ff198276d1177b8ae40679f5a656a481a7d4e3e8a35a63a65f7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosguard-linux-amd64"
        sha256 "8212f1ea75bbe3c149b8beabaf432d9e29a5322756ced39a1f9ddcc4417eef8e"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/agent-terminal-linux-amd64"
        sha256 "2cef5376b15154291fbdab7891259709900461292c3fa580a1d73e3a3e47f863"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosterm-linux-amd64"
        sha256 "2cef5376b15154291fbdab7891259709900461292c3fa580a1d73e3a3e47f863"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aos-linux-arm64"
      sha256 "72a8767a1df445231df7fae7a57a565982d5da6c69d67495dfb5bdf975696263"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aoscompose-linux-arm64"
        sha256 "72a8767a1df445231df7fae7a57a565982d5da6c69d67495dfb5bdf975696263"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosward-linux-arm64"
        sha256 "72a8767a1df445231df7fae7a57a565982d5da6c69d67495dfb5bdf975696263"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosguard-linux-arm64"
        sha256 "842760987c2530bbecb9da3ca052815578e3b27b2c7433675902bb08bacd10cf"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/agent-terminal-linux-arm64"
        sha256 "38dbbcc8d53aa512b033a734f919afbbac1231b0e3184c83760f25a8e919a084"
      end
      resource "aosterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.189.0/aosterm-linux-arm64"
        sha256 "38dbbcc8d53aa512b033a734f919afbbac1231b0e3184c83760f25a8e919a084"
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
