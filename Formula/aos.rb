class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.470.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aos-darwin-arm64"
      sha256 "aa332aa2e634698cd8fab3dc2ab72b62eb507a7c987280b793eb6bbcb168b94f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aoscompose-darwin-arm64"
        sha256 "aa332aa2e634698cd8fab3dc2ab72b62eb507a7c987280b793eb6bbcb168b94f"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aosward-darwin-arm64"
        sha256 "aa332aa2e634698cd8fab3dc2ab72b62eb507a7c987280b793eb6bbcb168b94f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aosguard-darwin-arm64"
        sha256 "9ccea15ccab37d5e9151fb8190966b96f255f6e6dde3c170e68eef2350858c2d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aterm-darwin-arm64"
        sha256 "dd782fac0f78081dbc00bc9f6e93d24e014865d026a8521bcceb4f3777df62b5"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aos-linux-amd64"
      sha256 "b2033803c3a3b361b10487e8149af835cc2c6b172f873bc10d2a0391609cd1bd"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aoscompose-linux-amd64"
        sha256 "b2033803c3a3b361b10487e8149af835cc2c6b172f873bc10d2a0391609cd1bd"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aosward-linux-amd64"
        sha256 "b2033803c3a3b361b10487e8149af835cc2c6b172f873bc10d2a0391609cd1bd"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aosguard-linux-amd64"
        sha256 "ed79c8487d0c24c0be0f26174052e9dfc83046141af5bd7c52a7e955d7b762a4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aterm-linux-amd64"
        sha256 "3a1d6df085ff10291543f3b8b375f66cb4e3447644b80d9b1d1e73cf6b7ffacf"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aos-linux-arm64"
      sha256 "191043bcb1b0236e1811aeec65bf688cfdf114b40b4a7263ebba108129575ff9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aoscompose-linux-arm64"
        sha256 "191043bcb1b0236e1811aeec65bf688cfdf114b40b4a7263ebba108129575ff9"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aosward-linux-arm64"
        sha256 "191043bcb1b0236e1811aeec65bf688cfdf114b40b4a7263ebba108129575ff9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aosguard-linux-arm64"
        sha256 "838f144491a543f4c1a81b0b0b70b82f8cd729b87c810e746c862fa66a726903"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.470.0/aterm-linux-arm64"
        sha256 "5f0cf94ef3d6e4f42af83f0094168fdeb23a93cd7416de4d9c782b531931bf80"
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
