class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.527.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aos-darwin-arm64"
    sha256 "0fcca97f6c8405fe4fd97e275983ee38c04e429e130f081a3bfb056da15784bd"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aoscompose-darwin-arm64"
      sha256 "0fcca97f6c8405fe4fd97e275983ee38c04e429e130f081a3bfb056da15784bd"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aosguard-darwin-arm64"
      sha256 "ad34b494afac8170e167bc4fa045764d227cea15036e5f4d8869344a34ae1bcf"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "08cee5a2c71a4c0696eff523aeca56fda41d75509cbbc975aab547b954bd8cf3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aos-linux-amd64"
      sha256 "86e5d3ea2259a54400d95cd67a94c3d95b313cc6692bd01eda2d5b3b0ad9c5aa"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aoscompose-linux-amd64"
        sha256 "86e5d3ea2259a54400d95cd67a94c3d95b313cc6692bd01eda2d5b3b0ad9c5aa"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aosguard-linux-amd64"
        sha256 "a8afc34495c9111ff9b672b7b631a6665b435c7532829c3063dc69b0c86d526a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aterm-linux-amd64"
        sha256 "f53fcb0c4795b8f33c4146764917749bf34187fe293cbe46e7b2e505aebbd69c"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aos-linux-arm64"
      sha256 "124c184d47ef11dc310abf5fabda178b5e6f9b50e36110bf0a7671644791e9f2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aoscompose-linux-arm64"
        sha256 "124c184d47ef11dc310abf5fabda178b5e6f9b50e36110bf0a7671644791e9f2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aosguard-linux-arm64"
        sha256 "cff7d77f72457fbdfa5b471a770eea578e41a1322fb7de86930389800dd35a13"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.527.0/aterm-linux-arm64"
        sha256 "88e878fc8f6042beccae78af0d1a5e7583d2444a637fe10b21b99f51c17bd26a"
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
