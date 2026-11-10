class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.570.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aos-darwin-arm64"
    sha256 "544690b3f5d3618320175be209e6d86115013323ad29519e4d6b3564e0ebc643"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aoscompose-darwin-arm64"
      sha256 "544690b3f5d3618320175be209e6d86115013323ad29519e4d6b3564e0ebc643"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aosguard-darwin-arm64"
      sha256 "e69c5d3cfe170bae44f4312bc311d23266c35fdd6fdd4c712a3a5bd0f2a4e3a6"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "1a7f777e4a3ceb1ff034c4fcb74d7836b7fc036ba0a700157951a6b74243c39b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aos-linux-amd64"
      sha256 "e8d6d2b7fb72083784e6696005c1802c1d59fee72ca31b315f8df77b25c05448"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aoscompose-linux-amd64"
        sha256 "e8d6d2b7fb72083784e6696005c1802c1d59fee72ca31b315f8df77b25c05448"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aosguard-linux-amd64"
        sha256 "29d1570fe9e7716934bd33c0e04b85dcca7b7afd01d0d179c9cb6b34aa09bc42"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aterm-linux-amd64"
        sha256 "6de01951f990a0f2c162e4bb8bbb8b62d0da9c11ea261b7a8c43a9aee26bf905"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aos-linux-arm64"
      sha256 "b92225d8549e08f69970cf893dfaa26f958d672e79a228bf3eae95e4da49551b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aoscompose-linux-arm64"
        sha256 "b92225d8549e08f69970cf893dfaa26f958d672e79a228bf3eae95e4da49551b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aosguard-linux-arm64"
        sha256 "bd93ccb42451789b34f09b63480c304e04d29e0abc26c8d914e5034c8303e1f9"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.570.0/aterm-linux-arm64"
        sha256 "15148ff7dd983f8b8ec5b97cdb4650cb0eb8583ddd3d066c3ae64411672e37ba"
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
