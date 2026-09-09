class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.318.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aos-darwin-arm64"
      sha256 "7d1fc7b374e4e75387cb1a36c587e88b9a5b76399247eda5f2ab3d484b354f5d"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aoscompose-darwin-arm64"
        sha256 "7d1fc7b374e4e75387cb1a36c587e88b9a5b76399247eda5f2ab3d484b354f5d"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aosward-darwin-arm64"
        sha256 "7d1fc7b374e4e75387cb1a36c587e88b9a5b76399247eda5f2ab3d484b354f5d"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aosguard-darwin-arm64"
        sha256 "4dfca331b473dbdd1c21843cab28e2385e51bac493f2d268b086c30985bc76d9"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aterm-darwin-arm64"
        sha256 "3b2595bdcedb19eaa9d10060cf57fe8070dac94b54f897f09435095c0475c7ea"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aos-linux-amd64"
      sha256 "f19abf8d5c71370a27a1d30dbaf1ebc789357c26dabdd2e29aef97e7b9c8580e"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aoscompose-linux-amd64"
        sha256 "f19abf8d5c71370a27a1d30dbaf1ebc789357c26dabdd2e29aef97e7b9c8580e"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aosward-linux-amd64"
        sha256 "f19abf8d5c71370a27a1d30dbaf1ebc789357c26dabdd2e29aef97e7b9c8580e"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aosguard-linux-amd64"
        sha256 "a58bd44ebf0f7e572e09d51002dd3851c6b7aea905d5954adf08b7592899de10"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aterm-linux-amd64"
        sha256 "28b8263437112da5cf1e77bbe312ad90a578a437cbf216743ea643662b716664"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aos-linux-arm64"
      sha256 "b153a805bb355ee9f834df27c9470a7c09806ee1925fb463e7c6a5ea9d6aee73"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aoscompose-linux-arm64"
        sha256 "b153a805bb355ee9f834df27c9470a7c09806ee1925fb463e7c6a5ea9d6aee73"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aosward-linux-arm64"
        sha256 "b153a805bb355ee9f834df27c9470a7c09806ee1925fb463e7c6a5ea9d6aee73"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aosguard-linux-arm64"
        sha256 "194d7b51fad85ca1113476762dd533440ff644972e34fcac6ba4741aa8a567e8"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.318.0/aterm-linux-arm64"
        sha256 "5f5d66db29247f1b25bf3249740ecd74b8fcea9be5abb1753550a9edf98d26ab"
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
