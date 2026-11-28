class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.648.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aos-darwin-arm64"
    sha256 "7bcfad8990e199d976989f485b5d78efde8b063bdae911d9c0c88605409bec44"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aoscompose-darwin-arm64"
      sha256 "7bcfad8990e199d976989f485b5d78efde8b063bdae911d9c0c88605409bec44"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aosguard-darwin-arm64"
      sha256 "090b931898e877557cae50d888a4b82dd638fe0415caa59a5adb8386e3746431"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "062a8fa53fdd4f8f2f5ed06f4df997046670ec20128f1b53e4b0842585ece1b0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aos-linux-amd64"
      sha256 "56cbb0f9333064fa156b1035e626fead6be918c4d043b91ffc70ffe2c68e87ed"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aoscompose-linux-amd64"
        sha256 "56cbb0f9333064fa156b1035e626fead6be918c4d043b91ffc70ffe2c68e87ed"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aosguard-linux-amd64"
        sha256 "9fcb001a5ddb670c7f3edf45223399ef87b6713b64be82f398bec7afd510ee5a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aterm-linux-amd64"
        sha256 "52e48467aeba786eba175a7aa30115c6e3dca9928bc1079d288081a774740705"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aos-linux-arm64"
      sha256 "27a77e4b442cab78c0e77a128af0134e7124c5e781cabf73718c8080528442d6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aoscompose-linux-arm64"
        sha256 "27a77e4b442cab78c0e77a128af0134e7124c5e781cabf73718c8080528442d6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aosguard-linux-arm64"
        sha256 "d115f8ac7f5a663129a9a7066ad8d0caffa187feb909a5f24c0eb02783612906"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.648.0/aterm-linux-arm64"
        sha256 "8e3e5c0613738357a8d159b5f89497d0e31abf84ce421cf79a050b5f00483370"
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
