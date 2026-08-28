class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.260.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aos-darwin-arm64"
      sha256 "c9776ffce170187aac7a12a10cc3eadacbe97d0d4c35281bf61ddb47c958518b"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aoscompose-darwin-arm64"
        sha256 "c9776ffce170187aac7a12a10cc3eadacbe97d0d4c35281bf61ddb47c958518b"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aosward-darwin-arm64"
        sha256 "c9776ffce170187aac7a12a10cc3eadacbe97d0d4c35281bf61ddb47c958518b"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aosguard-darwin-arm64"
        sha256 "a1c2b7e95031d12ca861b3105ad4180b72498d3a6bd54addb6fb41047663b789"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aterm-darwin-arm64"
        sha256 "ad3ce213fe23fcb90164104b8598aa6eceb796c599d6f5fa654393004c0628b9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aos-linux-amd64"
      sha256 "7d421a5a132ebbef558337db56c13a560d0137705c6755fda71705fc04f8d7c3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aoscompose-linux-amd64"
        sha256 "7d421a5a132ebbef558337db56c13a560d0137705c6755fda71705fc04f8d7c3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aosward-linux-amd64"
        sha256 "7d421a5a132ebbef558337db56c13a560d0137705c6755fda71705fc04f8d7c3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aosguard-linux-amd64"
        sha256 "64b394424adf792aae7c4bc59b2e901e7d7f702b1851f915f7142c5428d2a06f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aterm-linux-amd64"
        sha256 "17772f900233ff79294ba119a7b7e9e637bdbd1f50690de120f9fe7b74096e78"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aos-linux-arm64"
      sha256 "875f8e1bf963dcce693fa30a42ea5e05ff0eaa8e301108f14f6e1a665f43bd1f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aoscompose-linux-arm64"
        sha256 "875f8e1bf963dcce693fa30a42ea5e05ff0eaa8e301108f14f6e1a665f43bd1f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aosward-linux-arm64"
        sha256 "875f8e1bf963dcce693fa30a42ea5e05ff0eaa8e301108f14f6e1a665f43bd1f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aosguard-linux-arm64"
        sha256 "d9265ffe80f44cc8ba337bf082f3256a43721db6e24bdf03e7048a3a0467ce1f"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.260.0/aterm-linux-arm64"
        sha256 "a44a266bf81d14b21f1620875bc854befb09d71ed53fb568feb68839fee381fe"
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
