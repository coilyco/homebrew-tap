class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.526.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aos-darwin-arm64"
    sha256 "ad1f1dd45a48dd6ecdefa7693e2b757e63c1b55bb40f32e868a8ced3eec70d98"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aoscompose-darwin-arm64"
      sha256 "ad1f1dd45a48dd6ecdefa7693e2b757e63c1b55bb40f32e868a8ced3eec70d98"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aosguard-darwin-arm64"
      sha256 "77ac361bf4ea225b8affbc3893cfffe1d84bf8693b849338aa2f150148860d4b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "79c6b71768f1eb4558fe9be9ddeafdd93640e2699111f21f3b3452570c62b211"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aos-linux-amd64"
      sha256 "2af1538aae1c323235ed3886ad2253216f6ae142e9c9efa8c7ee08a4d76365dc"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aoscompose-linux-amd64"
        sha256 "2af1538aae1c323235ed3886ad2253216f6ae142e9c9efa8c7ee08a4d76365dc"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aosguard-linux-amd64"
        sha256 "d17bf52ce6db9b3f019717b54cf77365e45433b8c5f8427cf7eb14552e32f457"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aterm-linux-amd64"
        sha256 "b4affa945b3e9502f44338211586c85e52382a430c3f476bc546138740fac2a6"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aos-linux-arm64"
      sha256 "8f1fcff2112228213c25e50d103ab9e29c77b06753580c9a0e29ab9c0ed81965"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aoscompose-linux-arm64"
        sha256 "8f1fcff2112228213c25e50d103ab9e29c77b06753580c9a0e29ab9c0ed81965"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aosguard-linux-arm64"
        sha256 "4b86dc6739505dd42d7d384fc595ac431e1b6dd42671107a74a2ccba9c42b7ea"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.526.0/aterm-linux-arm64"
        sha256 "3b0d9287d51be66816c013e0e098427d98a2615bbf7d951b42b232f131273230"
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
