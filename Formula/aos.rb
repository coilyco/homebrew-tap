class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.607.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aos-darwin-arm64"
    sha256 "536c8e8fef46f448068dec21350a3f560cd483da372c074cb99723c7e535f0ab"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aoscompose-darwin-arm64"
      sha256 "536c8e8fef46f448068dec21350a3f560cd483da372c074cb99723c7e535f0ab"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aosguard-darwin-arm64"
      sha256 "08018301b87282177e77d974cd28dec0fe3ce163fe6e953f15f57d353a6a7572"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "c160be4a894095f563d9189ca2ec84449eb041d38beaee2d81fd9393803b1822"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aos-linux-amd64"
      sha256 "cadd6f21bf1dbcb5091a49c427e037003c46e1e8192de3781aa0ac62e0c20314"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aoscompose-linux-amd64"
        sha256 "cadd6f21bf1dbcb5091a49c427e037003c46e1e8192de3781aa0ac62e0c20314"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aosguard-linux-amd64"
        sha256 "213faf676466b95d4bb262ada36eff2e8cb9b839ec916e7d8652eac9c71d2326"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aterm-linux-amd64"
        sha256 "f04fbb39bdf976b4fa0ce8041e56e8833849b568b3f04c18351ccd261f702f33"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aos-linux-arm64"
      sha256 "b3d19cdb69f4ef470cbf1b52a3322c8e7aa526ab5ff83c15502343fe038c4608"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aoscompose-linux-arm64"
        sha256 "b3d19cdb69f4ef470cbf1b52a3322c8e7aa526ab5ff83c15502343fe038c4608"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aosguard-linux-arm64"
        sha256 "e8f657ad3dfeba1dd32660226da26d2fcc790945c897e9bf9fb666994997a920"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.607.0/aterm-linux-arm64"
        sha256 "8a9d58ffa31b104e9793b9536296a898dd3c8770616bf400dacf3666a7a504b1"
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
