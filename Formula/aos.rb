class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.584.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aos-darwin-arm64"
    sha256 "fd9212a86ae89c794e2e00d1e682fefad30f382ecd0aab1c05683775a84bb12e"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aoscompose-darwin-arm64"
      sha256 "fd9212a86ae89c794e2e00d1e682fefad30f382ecd0aab1c05683775a84bb12e"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aosguard-darwin-arm64"
      sha256 "59c5c8adceb40cc9544179880615cdfb345e4410bdecea5da595857a2d544f00"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "4917f29c82e9c64e652403d81a149f9564c754c6d2add141e3f79ebc1fa1ffd1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aos-linux-amd64"
      sha256 "e4b8dc26918e8ec7cd117ec2fb74d0df5bfa877547cf1953f98ba64d59299206"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aoscompose-linux-amd64"
        sha256 "e4b8dc26918e8ec7cd117ec2fb74d0df5bfa877547cf1953f98ba64d59299206"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aosguard-linux-amd64"
        sha256 "f70ceb1756cfcab46c1bb1e823fa7ca5468a39907b3ee7afe023aa51912ee985"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aterm-linux-amd64"
        sha256 "4bedea80a2f3c12f3bf7c68fc52eb25924a65d333418942faf69ecf786982b12"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aos-linux-arm64"
      sha256 "637e89227a515b52dd23936bcd3353022790ca0fc622491568f358f65822d587"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aoscompose-linux-arm64"
        sha256 "637e89227a515b52dd23936bcd3353022790ca0fc622491568f358f65822d587"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aosguard-linux-arm64"
        sha256 "0de38b24e378ba9580c5e5ed8ae7e9c6597b808d8cc692a93912b06530b4a2cb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.584.0/aterm-linux-arm64"
        sha256 "dbdf6124746fac645f57f25627959e2e477103b80887c1a7836afd2b585a0035"
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
