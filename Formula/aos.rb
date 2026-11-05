class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.524.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aos-darwin-arm64"
    sha256 "2caf84567f56d8ae0c83ce0152d0c16d844c3e3d20fcd2bd32a21f57934a3ee8"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aoscompose-darwin-arm64"
      sha256 "2caf84567f56d8ae0c83ce0152d0c16d844c3e3d20fcd2bd32a21f57934a3ee8"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aosguard-darwin-arm64"
      sha256 "157c31f932a901cbdba67ace4b337b7f4f008ed827a4f23db739d8e50962b662"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "71cdd7a0aaad01ccb5a94a815e63a9b450a3de91b13b1b9dfbab1899e19601f3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aos-linux-amd64"
      sha256 "86fcfbe571470f0c6c7f6f7267ff10d7bdf8e1065d20463b72ba06c9677dc12a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aoscompose-linux-amd64"
        sha256 "86fcfbe571470f0c6c7f6f7267ff10d7bdf8e1065d20463b72ba06c9677dc12a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aosguard-linux-amd64"
        sha256 "d82a3ffdcadd12c576dde965f170639ddebfd6c60ea750898fb4d8d8b6bbe8a7"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aterm-linux-amd64"
        sha256 "9b8687c33dc9e69a1a9b083254f9dbf924069e3f9dd80f3e1451756329f1cf76"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aos-linux-arm64"
      sha256 "38075bd2cab585ad64bdae4f7b90631b565b758227f1422d8db7c0edd7fc1c36"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aoscompose-linux-arm64"
        sha256 "38075bd2cab585ad64bdae4f7b90631b565b758227f1422d8db7c0edd7fc1c36"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aosguard-linux-arm64"
        sha256 "fbac66a429f0d1fa26cc7026a27ff4d77d30a216c7bfdc38342df14dce2b494c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.524.0/aterm-linux-arm64"
        sha256 "4fd32487548bf4dcf1dd312c447ca95298d1fc79e09a380ad37a02fb0dd4992b"
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
