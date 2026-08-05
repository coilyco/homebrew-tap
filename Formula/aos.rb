class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.160.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aos-darwin-arm64"
      sha256 "3a2c25675eb6208b175e18c107e4713d3c0c3404b7a774625ec29d9a47db7335"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aoscompose-darwin-arm64"
        sha256 "3a2c25675eb6208b175e18c107e4713d3c0c3404b7a774625ec29d9a47db7335"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aosward-darwin-arm64"
        sha256 "3a2c25675eb6208b175e18c107e4713d3c0c3404b7a774625ec29d9a47db7335"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aosguard-darwin-arm64"
        sha256 "5f3d5cf40f50e7b392c9bfd610d75e26d59e9b5903095aae42665671d44f49e8"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/agent-terminal-darwin-arm64"
        sha256 "f87ed02cd0e32bd6b126f652ff46ffe985f1fc2b16121f207c3328932f762a8e"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aos-linux-amd64"
      sha256 "d2da70e0ee224c3813c5a5f989fe9190dfec92572d5d35236379bf3fbc9dd85d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aoscompose-linux-amd64"
        sha256 "d2da70e0ee224c3813c5a5f989fe9190dfec92572d5d35236379bf3fbc9dd85d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aosward-linux-amd64"
        sha256 "d2da70e0ee224c3813c5a5f989fe9190dfec92572d5d35236379bf3fbc9dd85d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aosguard-linux-amd64"
        sha256 "596038b761bb96e22d977e59906595c9eabff8ab4d933d16e0d4e58d0db3aa77"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/agent-terminal-linux-amd64"
        sha256 "135eb42975c3adf440335496f9bb31bba1a85c707d3a6b8db5309ccf9710ec8b"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aos-linux-arm64"
      sha256 "3fab37ae828125ae1ea967017c0f9486a62d1720205ab0b3a8cfee4d55f80597"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aoscompose-linux-arm64"
        sha256 "3fab37ae828125ae1ea967017c0f9486a62d1720205ab0b3a8cfee4d55f80597"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aosward-linux-arm64"
        sha256 "3fab37ae828125ae1ea967017c0f9486a62d1720205ab0b3a8cfee4d55f80597"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/aosguard-linux-arm64"
        sha256 "408002a16a4f6c1cda7ff8b30afd2c7318b29c480affcbab722a058f0faa862a"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.160.0/agent-terminal-linux-arm64"
        sha256 "3b490af6cb510e0693e4fd0f0921e779748f6f737906755a8cbef680251f9be7"
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
