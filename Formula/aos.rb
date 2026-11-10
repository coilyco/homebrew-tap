class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.572.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aos-darwin-arm64"
    sha256 "bfbd2d117979e188c8b7cdef92304b606f6ac8b4d25f8fcc0aef3ee0982419f0"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aoscompose-darwin-arm64"
      sha256 "bfbd2d117979e188c8b7cdef92304b606f6ac8b4d25f8fcc0aef3ee0982419f0"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aosguard-darwin-arm64"
      sha256 "75478399889ec9b6849b4f1d13b9ac270d77823c572eeca05da8db02160665bf"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "a6f7811ea5fc96766ce9f73bcf7fa25e94c38dd1675575b342ca02e9c5e65fc0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aos-linux-amd64"
      sha256 "7ff90b8d4d7fbfc58d1450ca8a46dc0d228816edb0291b035c5d46b4edaa212e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aoscompose-linux-amd64"
        sha256 "7ff90b8d4d7fbfc58d1450ca8a46dc0d228816edb0291b035c5d46b4edaa212e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aosguard-linux-amd64"
        sha256 "52547f53abc6a4fed618e5de5672c1b7f8f17d814271de4d3d5a6a45f17ad3db"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aterm-linux-amd64"
        sha256 "ee54bab87b84b665d1975d4bf412c985dd7f35dd7b8a8d0741a60f1c15d1a24d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aos-linux-arm64"
      sha256 "e9693d029eac00d7c6beff24bbae74181e0d8505cddc15efd775b3e4854dfaa9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aoscompose-linux-arm64"
        sha256 "e9693d029eac00d7c6beff24bbae74181e0d8505cddc15efd775b3e4854dfaa9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aosguard-linux-arm64"
        sha256 "3416e11f57ee5da657d05b3650290cdf41e072843edc0c39868962188230cca4"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.572.0/aterm-linux-arm64"
        sha256 "08d23da616d5935dce0360119b9fd5c55644826c37eaa37595a271f1cc83966d"
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
