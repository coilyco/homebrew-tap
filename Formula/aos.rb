class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.621.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aos-darwin-arm64"
    sha256 "ed8ea00a56e73cb1f178051229fcb77fe1d3fb07389934181fd3fda6929c94d1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aoscompose-darwin-arm64"
      sha256 "ed8ea00a56e73cb1f178051229fcb77fe1d3fb07389934181fd3fda6929c94d1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aosguard-darwin-arm64"
      sha256 "07f5baf578dd080f663f4cb8b390a49207de71100b42260de9c3026ec2ba8a80"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "6b94b21899515af0653599d371fa22c3f2a7eee1bd5bd5af0b6ecb690cb39104"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aos-linux-amd64"
      sha256 "01b971dd5b41e2b9afd6a82d6e3d7e02d7a55b464563e45cbeb698a6b3df282f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aoscompose-linux-amd64"
        sha256 "01b971dd5b41e2b9afd6a82d6e3d7e02d7a55b464563e45cbeb698a6b3df282f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aosguard-linux-amd64"
        sha256 "99e9b581c31a8b7cc4e98cc751e390d68b29e592b053ac0f2a7f3d5e4f98f493"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aterm-linux-amd64"
        sha256 "b105663019b82abf659dd2b57af7b6f601f86c15a788546ae73fa0d32abc9641"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aos-linux-arm64"
      sha256 "ce4beb089a5f8d2189a11f5f942f1523c21c97055d17eae85d2672525843bedf"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aoscompose-linux-arm64"
        sha256 "ce4beb089a5f8d2189a11f5f942f1523c21c97055d17eae85d2672525843bedf"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aosguard-linux-arm64"
        sha256 "93217b67259ba4bda3abe819f35f3d56d2d6ad76dc1e5cd23946a00d68f753ce"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.621.0/aterm-linux-arm64"
        sha256 "8bdb439f36fafd1a4f6960fa53af5ce16c6ce8f0dd8482e32102bd88011784bf"
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
