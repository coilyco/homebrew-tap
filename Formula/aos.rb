class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.555.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aos-darwin-arm64"
    sha256 "b01b2952811d7c50522e48ef2550e92625c3b18ac459b09c389127883d93d2a9"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aoscompose-darwin-arm64"
      sha256 "b01b2952811d7c50522e48ef2550e92625c3b18ac459b09c389127883d93d2a9"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aosguard-darwin-arm64"
      sha256 "b992d895b5e3e3d0a5b0468c0e29fdbdcf50a611832bfb254415508130f82948"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "2a742810db672fda0a97f610ebb493b9a04b79593d59fbef3d1287e7eca6657d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aos-linux-amd64"
      sha256 "1b67d7a92cbcf3880fcc6ab0c7c62355bced6c802f817a73c6703b641825b850"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aoscompose-linux-amd64"
        sha256 "1b67d7a92cbcf3880fcc6ab0c7c62355bced6c802f817a73c6703b641825b850"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aosguard-linux-amd64"
        sha256 "171dd46fd6d7ea4c583a8c33670edc1989d28fa607b56a3e06b7602b53427593"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aterm-linux-amd64"
        sha256 "1806d5be9269ec6083e30919ea5fcedfbcb51c596d956baf4f4aa9108ce8295f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aos-linux-arm64"
      sha256 "55288c1312d4780c16842d6bcfde828e408ee1431d3dd4ae4ab2914cc9c4629b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aoscompose-linux-arm64"
        sha256 "55288c1312d4780c16842d6bcfde828e408ee1431d3dd4ae4ab2914cc9c4629b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aosguard-linux-arm64"
        sha256 "5932b8f24abda9140f39ed95889b8cfc2a910d61e408b3badeb10b609845fa71"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.555.0/aterm-linux-arm64"
        sha256 "a04ff49c83f24c08be56f26b3fc274728daae31e67d79fc45eca3282c899b4a7"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    # macOS installs the signed bundle, whole (:nounzip) because a stage would
    # step into it, and links bin/aterm to its executable. See docs/aos-cli.md.
    if OS.mac?
      resource("aterm").stage do
        system "tar", "-xzf", Dir["*.tar.gz"].first, "-C", prefix
      end
      bin.install_symlink prefix/"Treehouse.app/Contents/MacOS/aterm"
    else
      resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
