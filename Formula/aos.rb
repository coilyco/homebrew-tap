class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os"
  version "0.314.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aos-darwin-arm64"
      sha256 "0e9256e1f60faa4873d6b0e4cf0c7478dc87f1faf75d61717af55a284c538fe3"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aoscompose-darwin-arm64"
        sha256 "0e9256e1f60faa4873d6b0e4cf0c7478dc87f1faf75d61717af55a284c538fe3"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aosward-darwin-arm64"
        sha256 "0e9256e1f60faa4873d6b0e4cf0c7478dc87f1faf75d61717af55a284c538fe3"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aosguard-darwin-arm64"
        sha256 "2f4fba8238cad7a2f22391b1181bd94075baa1e245b7627d38cb873242268866"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aterm-darwin-arm64"
        sha256 "f91926cb7d514a8436ec140b3dd8bd8fef92658dd34003b02dd2543a727f85f0"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aos-linux-amd64"
      sha256 "4e1708771d8c85a22360c10d71fbf4391c7da0468cb3bf3f2fcf666fc4b15797"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aoscompose-linux-amd64"
        sha256 "4e1708771d8c85a22360c10d71fbf4391c7da0468cb3bf3f2fcf666fc4b15797"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aosward-linux-amd64"
        sha256 "4e1708771d8c85a22360c10d71fbf4391c7da0468cb3bf3f2fcf666fc4b15797"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aosguard-linux-amd64"
        sha256 "65451feaeedc711166248fa91ebf311a2f26f6437f76770d093b79f31e4e7f4d"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aterm-linux-amd64"
        sha256 "5a003af5d6dac22a796d4ed46be5c94024dc17f064969fc313cbab8d9fc3075e"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aos-linux-arm64"
      sha256 "4b26a407176c5384728c849a032ca684de2aa302963305ef1c7bea9c4302cf0f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aoscompose-linux-arm64"
        sha256 "4b26a407176c5384728c849a032ca684de2aa302963305ef1c7bea9c4302cf0f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aosward-linux-arm64"
        sha256 "4b26a407176c5384728c849a032ca684de2aa302963305ef1c7bea9c4302cf0f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aosguard-linux-arm64"
        sha256 "d3b746e44653b33214926673f7094c07da034b079c2f6787e723dab85cb4d26e"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco-flight-deck/agentic-os/releases/download/aos-v0.314.0/aterm-linux-arm64"
        sha256 "cf746b881c07ee9ecb7d724351303e958f1353aa9d94c5f3e8a8b9809c8b28a8"
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
