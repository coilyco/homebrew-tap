class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.522.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aos-darwin-arm64"
    sha256 "24a5ebd9ca8dff5451b4a558327576588036a076be218c5cde2e7cfee452d1ac"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aoscompose-darwin-arm64"
      sha256 "24a5ebd9ca8dff5451b4a558327576588036a076be218c5cde2e7cfee452d1ac"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aosguard-darwin-arm64"
      sha256 "b4675089047967c5881045b0b00b107299abdfb3f2a915dd93647d5af0d9f5ce"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "435da94719e623162f95147ed2337102173a48ed4cb19a38492927b01c846049"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aos-linux-amd64"
      sha256 "322b0f4074e2bc60f1c8bd9bcfc0e702360d26fc463fa444a3960bbaba6f49cc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aoscompose-linux-amd64"
        sha256 "322b0f4074e2bc60f1c8bd9bcfc0e702360d26fc463fa444a3960bbaba6f49cc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aosguard-linux-amd64"
        sha256 "454e06a8a4ab663ce4ec3652e906f697a7568aa2ea38dbf7b76d6f16adc9848b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aterm-linux-amd64"
        sha256 "05c7d377e2750051d77683f114ac43b187f8d7fcd8726074ee0e5ffa5837e07f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aos-linux-arm64"
      sha256 "6df81b2b0bbed6c39fb5d2b2946ae73d3f141818a44b5fcf56e033d22ba7654b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aoscompose-linux-arm64"
        sha256 "6df81b2b0bbed6c39fb5d2b2946ae73d3f141818a44b5fcf56e033d22ba7654b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aosguard-linux-arm64"
        sha256 "c240e281066113913fed0fb3b6ad7279d257ce8fd09f09c09b2004e3aa0c0c49"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.522.0/aterm-linux-arm64"
        sha256 "958f864596df383313f743dc0eab2c6dde3aeae56deb06bc2ea9a26a3acb4027"
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
