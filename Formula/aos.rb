class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://forgejo.coilysiren.me/coilyco/agentic-os"
  version "0.373.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aos-darwin-arm64"
      sha256 "34e7f0aeaff3263a8eeebb160de00c7d9bbec2833bd1bac52f386f26355e6964"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aoscompose-darwin-arm64"
        sha256 "34e7f0aeaff3263a8eeebb160de00c7d9bbec2833bd1bac52f386f26355e6964"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aosward-darwin-arm64"
        sha256 "34e7f0aeaff3263a8eeebb160de00c7d9bbec2833bd1bac52f386f26355e6964"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aosguard-darwin-arm64"
        sha256 "e840a5575bf2a3b923f7dafd1af0431849168be147f887544ee03d88b4057250"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aterm-darwin-arm64"
        sha256 "78c1f0582c4e81bdb72106cc9d101bcf8720ab9dc6eaad41b6a6c34dcc373598"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aos-linux-amd64"
      sha256 "be775a40b6980337a9c3c95f34fb46391fa0c2475789c4c1a7330fe58205cc73"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aoscompose-linux-amd64"
        sha256 "be775a40b6980337a9c3c95f34fb46391fa0c2475789c4c1a7330fe58205cc73"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aosward-linux-amd64"
        sha256 "be775a40b6980337a9c3c95f34fb46391fa0c2475789c4c1a7330fe58205cc73"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aosguard-linux-amd64"
        sha256 "442d298a67f09640da4ebb0a8d4015f8d162b60a9aa1aa5d4ae78a01ef48fbdc"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aterm-linux-amd64"
        sha256 "9d9f0d83769b2da835053fdcf2ec598a3963d8cb75552b86e6d51d91e2f33311"
      end
    end
    on_arm do
      url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aos-linux-arm64"
      sha256 "ca033715c826b86a69e4744b3f8ce472647486b90802bb66c72ea98472c9173f"
      resource "aoscompose" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aoscompose-linux-arm64"
        sha256 "ca033715c826b86a69e4744b3f8ce472647486b90802bb66c72ea98472c9173f"
      end
      resource "aosward" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aosward-linux-arm64"
        sha256 "ca033715c826b86a69e4744b3f8ce472647486b90802bb66c72ea98472c9173f"
      end
      resource "aosguard" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aosguard-linux-arm64"
        sha256 "9d2d69b7e2fd5ceb7d497d5ad81897a58e863281d000aa07e4e57f82f03c3930"
      end
      resource "aterm" do
        url "https://forgejo.coilysiren.me/coilyco/agentic-os/releases/download/aos-v0.373.0/aterm-linux-arm64"
        sha256 "8d85add54650fcd53d20b352dc62d00a7e777aa287406eeb9c4450325c8e8e76"
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
