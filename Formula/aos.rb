class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.604.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aos-darwin-arm64"
    sha256 "e61b6392f4c52fed5b9063a21b2a90eb9c446dfde79afab67f942dea541d62d7"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aoscompose-darwin-arm64"
      sha256 "e61b6392f4c52fed5b9063a21b2a90eb9c446dfde79afab67f942dea541d62d7"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aosguard-darwin-arm64"
      sha256 "c10ee7b2cb606eed7b8d35745182b7a096327a36ce6019a1cbd0f3ca00aaf4d9"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "fd2e38c5a600151a57041f0423dd830925fd2656e6fed0d3d910deeeb2d11b0d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aos-linux-amd64"
      sha256 "45093cdc697b31bdd832639228faa21d35f77aa002a3daa0c10297b9c82ea4e9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aoscompose-linux-amd64"
        sha256 "45093cdc697b31bdd832639228faa21d35f77aa002a3daa0c10297b9c82ea4e9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aosguard-linux-amd64"
        sha256 "0f04f4e8a8ef972e8645fe440a9fe4ed5752151256ab4d9a460749136995ff11"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aterm-linux-amd64"
        sha256 "521ca1fe731ae15abbb6db5a1512c68e372bb302fd67ace90bb6528a48face93"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aos-linux-arm64"
      sha256 "7cf6f14e368fafc232c9a941a306c639ae311aab0d9df479601d953fe3bd27e5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aoscompose-linux-arm64"
        sha256 "7cf6f14e368fafc232c9a941a306c639ae311aab0d9df479601d953fe3bd27e5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aosguard-linux-arm64"
        sha256 "af3c6641ca29ba5b9d4d1e6f4227097985d63d6beb8fd3bfc37890f928741300"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.604.0/aterm-linux-arm64"
        sha256 "67945560ffc7edac35d7bcf5d56527b4a0022a6f02af9473541747418e37f4b0"
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
