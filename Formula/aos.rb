class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.461.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aos-darwin-arm64"
      sha256 "882be073c72959df4abe209dc45050f90489162d25fa32234dc9477bbad3e941"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aoscompose-darwin-arm64"
        sha256 "882be073c72959df4abe209dc45050f90489162d25fa32234dc9477bbad3e941"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aosward-darwin-arm64"
        sha256 "882be073c72959df4abe209dc45050f90489162d25fa32234dc9477bbad3e941"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aosguard-darwin-arm64"
        sha256 "b81deeae90375a54a82580f0ffd176dd6ab807dc72f1dd59884628ead27c89ec"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aterm-darwin-arm64"
        sha256 "18643ff8c88bbcc8ce01a538018448346cddc407685ea56cbec569914a534e7b"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aos-linux-amd64"
      sha256 "586b0150b0915158ab182870b124c6c6c0c2e49223f2e5fe973d83a48f7ed4d2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aoscompose-linux-amd64"
        sha256 "586b0150b0915158ab182870b124c6c6c0c2e49223f2e5fe973d83a48f7ed4d2"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aosward-linux-amd64"
        sha256 "586b0150b0915158ab182870b124c6c6c0c2e49223f2e5fe973d83a48f7ed4d2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aosguard-linux-amd64"
        sha256 "c0a63606c9de01a3b5f01764b3935f62fcf5438317dc0eeb221dbd514b172bef"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aterm-linux-amd64"
        sha256 "295ef1e73afbf0aac61afbb565575b860ca26b0a8320d0d4c33a89db33fdc27d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aos-linux-arm64"
      sha256 "d991e310aac4a1c21faf6909f19ffb7a7f30299148c039596396eab78aab7ac5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aoscompose-linux-arm64"
        sha256 "d991e310aac4a1c21faf6909f19ffb7a7f30299148c039596396eab78aab7ac5"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aosward-linux-arm64"
        sha256 "d991e310aac4a1c21faf6909f19ffb7a7f30299148c039596396eab78aab7ac5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aosguard-linux-arm64"
        sha256 "e528365d6b3a7900572d463b8407c3e36c3d3bfad841a014970a39d9e64f6923"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.461.0/aterm-linux-arm64"
        sha256 "1374e03bc9ddaa02fcbcfe1dced76d53f6872a20b0d269231fe1a92f6d3c5476"
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
