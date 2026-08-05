class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.155.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aos-darwin-arm64"
      sha256 "7b1fdb1d451e988bb441dda2df17cda677c505a4d6486792dedb3bbe76bec7d1"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aoscompose-darwin-arm64"
        sha256 "7b1fdb1d451e988bb441dda2df17cda677c505a4d6486792dedb3bbe76bec7d1"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aosward-darwin-arm64"
        sha256 "7b1fdb1d451e988bb441dda2df17cda677c505a4d6486792dedb3bbe76bec7d1"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aosguard-darwin-arm64"
        sha256 "8517f7bcb047fa054700934eb5c08e8949d833f7feda0e431ea171f815b7e9fd"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/agent-terminal-darwin-arm64"
        sha256 "4c8f639a5c97f75269a49fd67ebb5ed2cb19ef5f7cad73754f2b7b1843f8fea8"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aos-linux-amd64"
      sha256 "efea8deabf99f9774c05a337ba4d1d12af1068c3c6daf022c97f2747af29f8a7"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aoscompose-linux-amd64"
        sha256 "efea8deabf99f9774c05a337ba4d1d12af1068c3c6daf022c97f2747af29f8a7"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aosward-linux-amd64"
        sha256 "efea8deabf99f9774c05a337ba4d1d12af1068c3c6daf022c97f2747af29f8a7"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aosguard-linux-amd64"
        sha256 "9778eb4fb280ad2cf8375fee0119c3ee590f1a93cc9d2cadc7f98067262dfd8e"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/agent-terminal-linux-amd64"
        sha256 "c32e6b388ee9157f227e6e38defa7fe6ed08655bcee8712ecc8da705b7fb08f5"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aos-linux-arm64"
      sha256 "ab408b75f97639bcb07c120d08760da5f899405d86529485b3fff672548ab4ab"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aoscompose-linux-arm64"
        sha256 "ab408b75f97639bcb07c120d08760da5f899405d86529485b3fff672548ab4ab"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aosward-linux-arm64"
        sha256 "ab408b75f97639bcb07c120d08760da5f899405d86529485b3fff672548ab4ab"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/aosguard-linux-arm64"
        sha256 "c2922c7ab55720b00d4d15796857e21044ee8a08c38e16a4be1162e6a8de916c"
      end
      resource "agent-terminal" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.155.0/agent-terminal-linux-arm64"
        sha256 "9ea852ec3a1b39dd2c5be4856a82ad25eb01b298212aa7ad7bcc4775bc3184f2"
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
