class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.548.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aos-darwin-arm64"
    sha256 "3ea3fb3a120974a19e55b5eb13fa17657e91e2c19b1933bee1c24dbd9b50f268"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aoscompose-darwin-arm64"
      sha256 "3ea3fb3a120974a19e55b5eb13fa17657e91e2c19b1933bee1c24dbd9b50f268"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aosguard-darwin-arm64"
      sha256 "2fb75c37f1d931fd0d713780751aeeb8a4424078e839afcf3625ad9db2b6e7cf"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "5d1b0cafc71c05e3b05102718aa3ba943c5efe7f97bfe4faab66d4c654c1a5ce"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aos-linux-amd64"
      sha256 "55014913d278dced0a07f932325c2a3180a21711c79ffe94668d83e1c18ba8e2"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aoscompose-linux-amd64"
        sha256 "55014913d278dced0a07f932325c2a3180a21711c79ffe94668d83e1c18ba8e2"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aosguard-linux-amd64"
        sha256 "06eaacfe85e515319f12ad7188b20a457d8d67f91320825a70edd4ed29e82ba5"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aterm-linux-amd64"
        sha256 "3bb2099c87eccb50d1841c61bc771a71f11048d9c3f6492d51d68d49de7f4f0d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aos-linux-arm64"
      sha256 "d878bf7e5582934c35745e462f5153d055d30ab8f000cd59db363c31d67a2f16"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aoscompose-linux-arm64"
        sha256 "d878bf7e5582934c35745e462f5153d055d30ab8f000cd59db363c31d67a2f16"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aosguard-linux-arm64"
        sha256 "2bdf5e9085028586b898d9b9b62970d0e4f09c0fe0a978e8457be773472e0e9c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.548.0/aterm-linux-arm64"
        sha256 "07dea6ba01940eb0033fa44b7cd5b69334a15bc4dfcee90b1cddaca6831fe8d4"
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
