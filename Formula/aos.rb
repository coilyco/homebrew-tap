class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.241.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aos-darwin-arm64"
      sha256 "8d4af221e90faa3dd9976f880d9477a519492c20f9071f42ffd387ed0a421a99"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aoscompose-darwin-arm64"
        sha256 "8d4af221e90faa3dd9976f880d9477a519492c20f9071f42ffd387ed0a421a99"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aosward-darwin-arm64"
        sha256 "8d4af221e90faa3dd9976f880d9477a519492c20f9071f42ffd387ed0a421a99"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aosguard-darwin-arm64"
        sha256 "f096a29a2c80d001a799fe5e5263e176c0ac49f06a3eedee2957ec9b3931b535"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aterm-darwin-arm64"
        sha256 "7a7f9b150992fdea5fd60f74eeb949a3919860305eadf3e506d2636b1a31c177"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aos-linux-amd64"
      sha256 "e020bf5854731f4b4ec47442c67d7b2eea1210127a2dadf6928f23e832b02f15"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aoscompose-linux-amd64"
        sha256 "e020bf5854731f4b4ec47442c67d7b2eea1210127a2dadf6928f23e832b02f15"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aosward-linux-amd64"
        sha256 "e020bf5854731f4b4ec47442c67d7b2eea1210127a2dadf6928f23e832b02f15"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aosguard-linux-amd64"
        sha256 "55ce2ec59b02b931cd0793febf8e83553cc0467c06d7eba73bac30c457c29d56"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aterm-linux-amd64"
        sha256 "670dacffd342c98e12ae0ace98b41fe767d542a1312e3b91b142768b66e64ba9"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aos-linux-arm64"
      sha256 "a937422bb6d778e643476dfe4a4a783d4aa8b29f04d2bb134aa759595d428154"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aoscompose-linux-arm64"
        sha256 "a937422bb6d778e643476dfe4a4a783d4aa8b29f04d2bb134aa759595d428154"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aosward-linux-arm64"
        sha256 "a937422bb6d778e643476dfe4a4a783d4aa8b29f04d2bb134aa759595d428154"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aosguard-linux-arm64"
        sha256 "33bf94cf6cd0b174f186c9a953b6a1a4de544f7bf0b7fde69a756ba563d4265d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.241.0/aterm-linux-arm64"
        sha256 "c55ac52168ce5d217ddc265633fcfc26db7431f3c90bb2535ffbe708d5b29afc"
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
