class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.336.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aos-darwin-arm64"
      sha256 "edc29e0845710bdc2a0db77a57b10b79747add854c3257d0645120515f418792"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aoscompose-darwin-arm64"
        sha256 "edc29e0845710bdc2a0db77a57b10b79747add854c3257d0645120515f418792"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aosward-darwin-arm64"
        sha256 "edc29e0845710bdc2a0db77a57b10b79747add854c3257d0645120515f418792"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aosguard-darwin-arm64"
        sha256 "9128f5df9bb4b378c5c3ef968c8271c46df50e03da9f66dae69047db31ae7246"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aterm-darwin-arm64"
        sha256 "e292b4d276971fbf4cd1c2b529268d2345a2c4b98486fe7a1ab6ddcbc19356f2"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aos-linux-amd64"
      sha256 "f640d2fc8b2075d8918c0c2581f4afc280a101afbc37204a9f84bc5a8e765882"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aoscompose-linux-amd64"
        sha256 "f640d2fc8b2075d8918c0c2581f4afc280a101afbc37204a9f84bc5a8e765882"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aosward-linux-amd64"
        sha256 "f640d2fc8b2075d8918c0c2581f4afc280a101afbc37204a9f84bc5a8e765882"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aosguard-linux-amd64"
        sha256 "f01a5304095cf130d474bfb823fab7b74d7a7c626197f525b9917f6b3bea0280"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aterm-linux-amd64"
        sha256 "3a0084614bfac50b1e715b6b76bc1b735970512e417bf871fe2e986465b119b6"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aos-linux-arm64"
      sha256 "354516134cac00527ecad9f764aebd9f648d7b979590c65702ce49b6603e3088"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aoscompose-linux-arm64"
        sha256 "354516134cac00527ecad9f764aebd9f648d7b979590c65702ce49b6603e3088"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aosward-linux-arm64"
        sha256 "354516134cac00527ecad9f764aebd9f648d7b979590c65702ce49b6603e3088"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aosguard-linux-arm64"
        sha256 "0d62b555680b09cb196260270288ad76949e76e7fd30e12985b98b21e08ec764"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.336.0/aterm-linux-arm64"
        sha256 "499acd8de0fa48e7ba2ca60808a2cdd47150dc2d7d90f3f4332b3ede60e71385"
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
