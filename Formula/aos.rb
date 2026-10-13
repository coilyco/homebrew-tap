class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.477.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aos-darwin-arm64"
      sha256 "8263eac782485f25a75e64e896d342fe7047da3cbd663104dbad9bbe326c60a8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aoscompose-darwin-arm64"
        sha256 "8263eac782485f25a75e64e896d342fe7047da3cbd663104dbad9bbe326c60a8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aosguard-darwin-arm64"
        sha256 "d46184745b7d14c162f57ef9adc7efd9997d95e356ffc51c6347869f5ace4a9c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aterm-darwin-arm64"
        sha256 "554a3867aa5ac522fe5269f0f8737f27e3cf2d6c6ef811c1e1596d8dc5afa033"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aos-linux-amd64"
      sha256 "d89a0c0caac066dd0d3d7648cdd1e0ddb65a43529f15d4dfed261140526df8f3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aoscompose-linux-amd64"
        sha256 "d89a0c0caac066dd0d3d7648cdd1e0ddb65a43529f15d4dfed261140526df8f3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aosguard-linux-amd64"
        sha256 "2fffc1f77301cebf42d4a60d635ba9bbafdc041ec433a98858f6ed556124fab8"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aterm-linux-amd64"
        sha256 "43a446467e0de522f0746240ba301b1303bfcb23b1b50d73f5a93fbd538787db"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aos-linux-arm64"
      sha256 "7cc9666b999143a78b1613f49af95657e55b92111892e615522466608090c80f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aoscompose-linux-arm64"
        sha256 "7cc9666b999143a78b1613f49af95657e55b92111892e615522466608090c80f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aosguard-linux-arm64"
        sha256 "447845deaa72871d2f654ab7b0f0e17570de5bd4ded3f6442b5e91306a85fa13"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.477.0/aterm-linux-arm64"
        sha256 "ca3358fa7615bee3d40d592c4bdbf0c1a131e1220a248931fb5eb0753565692c"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
