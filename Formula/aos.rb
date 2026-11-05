class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.528.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aos-darwin-arm64"
    sha256 "e20706b22aa0f85a9fd7e51db3ad9193c053cda6aa6ff015ddb71b6bbf8afce2"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aoscompose-darwin-arm64"
      sha256 "e20706b22aa0f85a9fd7e51db3ad9193c053cda6aa6ff015ddb71b6bbf8afce2"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aosguard-darwin-arm64"
      sha256 "190f37e70365eab44aa4e8c358ce1ba0108ac944812a5030fdbe150444be7fab"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "edbe19ebd063910f0695a76c6b42f8fb70bd8b9127b5f7b398b65483bb1ce7f5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aos-linux-amd64"
      sha256 "5b21186f96b2285000937c373a713c2568fd6b8329d38f413634160dbf76f09c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aoscompose-linux-amd64"
        sha256 "5b21186f96b2285000937c373a713c2568fd6b8329d38f413634160dbf76f09c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aosguard-linux-amd64"
        sha256 "d32923edc8dc5ddb7b671c39900fd3a9b36bcc7e461a71379ffb025848bcb0ed"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aterm-linux-amd64"
        sha256 "b18b3ca09a72921cd437bb74276ea1464fd290ee08f82b269509dcb177784082"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aos-linux-arm64"
      sha256 "6eab8155f45cf81f02976854ab0282feee22c0eadbc10060a4d8cb407a281635"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aoscompose-linux-arm64"
        sha256 "6eab8155f45cf81f02976854ab0282feee22c0eadbc10060a4d8cb407a281635"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aosguard-linux-arm64"
        sha256 "09aed2d8c8d34593827ca08e876746af85212c765f1fde2d95fe91631fdc57d2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.528.0/aterm-linux-arm64"
        sha256 "ccec41fcae58939db49a8bdb7928ee87ef62b44fb4e3acbbf5a2a54c67ae182c"
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
