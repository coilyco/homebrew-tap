class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.286.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aos-darwin-arm64"
      sha256 "2e575b0e4e5487d343888514d98999b3ea5e533b05ddcfb64b4aa511387b27c7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aoscompose-darwin-arm64"
        sha256 "2e575b0e4e5487d343888514d98999b3ea5e533b05ddcfb64b4aa511387b27c7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aosward-darwin-arm64"
        sha256 "2e575b0e4e5487d343888514d98999b3ea5e533b05ddcfb64b4aa511387b27c7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aosguard-darwin-arm64"
        sha256 "1e6f48704357f86accc181b4646e91d16109d2466afed50c59ed921291386146"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aterm-darwin-arm64"
        sha256 "673d1cab7c1e975ea704ec0fedc11690284ae3ea013ce89b5efe217c9c5dc294"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aos-linux-amd64"
      sha256 "3846213f47501c398b390054a6422427e6e27bf1c79555204d753f869fa2cdc8"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aoscompose-linux-amd64"
        sha256 "3846213f47501c398b390054a6422427e6e27bf1c79555204d753f869fa2cdc8"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aosward-linux-amd64"
        sha256 "3846213f47501c398b390054a6422427e6e27bf1c79555204d753f869fa2cdc8"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aosguard-linux-amd64"
        sha256 "780e40644105df59e839a196e382f9489406a3d9646944679d78f541fe660727"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aterm-linux-amd64"
        sha256 "b46422f2eafc25efaf13d6afcd658a08ee5ae01696574e40ae3ee343e34780cb"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aos-linux-arm64"
      sha256 "723a306186e585756e16e1af4f0936a746fc4a93adda7a156389fb3e4c50011b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aoscompose-linux-arm64"
        sha256 "723a306186e585756e16e1af4f0936a746fc4a93adda7a156389fb3e4c50011b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aosward-linux-arm64"
        sha256 "723a306186e585756e16e1af4f0936a746fc4a93adda7a156389fb3e4c50011b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aosguard-linux-arm64"
        sha256 "94bc2ca6d1fb5ee9c93cff379795f2531302507b9a472677a4fdcf9ed241a422"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.286.0/aterm-linux-arm64"
        sha256 "5ba18d547919881257267f15ca51723c4db6272d9144e653cce495d72b072ed0"
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
