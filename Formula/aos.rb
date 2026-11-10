class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.574.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aos-darwin-arm64"
    sha256 "07f2926c22c1c9a08fa5bce35d5c8e2378213ff3e7fc2180a00fe60335719557"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aoscompose-darwin-arm64"
      sha256 "07f2926c22c1c9a08fa5bce35d5c8e2378213ff3e7fc2180a00fe60335719557"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aosguard-darwin-arm64"
      sha256 "03c6514f96141c82eed40803f3eb9480214a42acba9cfc0f06866b3bd1c1cccc"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "5a2a8a35939ef4955ab549ad4a30110657c80925e7745726fafab36daebfbbba"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aos-linux-amd64"
      sha256 "0e2ae7a69332c64b051eb052e4bb01d99f1302c88e7410919a4f22d25e2dff8d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aoscompose-linux-amd64"
        sha256 "0e2ae7a69332c64b051eb052e4bb01d99f1302c88e7410919a4f22d25e2dff8d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aosguard-linux-amd64"
        sha256 "90de1113bcbb4d0b226b5d74e86826ff28e2e359c5ebe549f4f4faf05c5d7f31"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aterm-linux-amd64"
        sha256 "0e2d1b72cddb5a60cb29ec16fcdd64a27feb81108fc3b31bd5025299de1a4acb"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aos-linux-arm64"
      sha256 "9850a7685480d063c7cae3736f8cf41f32df30c93eebabb91b3c0bbab3d01923"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aoscompose-linux-arm64"
        sha256 "9850a7685480d063c7cae3736f8cf41f32df30c93eebabb91b3c0bbab3d01923"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aosguard-linux-arm64"
        sha256 "047bdc755ce9624c5ec7a7a0c304c5bc079518d9eea91418f528958d70106a81"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.574.0/aterm-linux-arm64"
        sha256 "353034c9099687fed4bd6714ba0d4348d2f7ea9a4b0336fc7246f99cd925de4b"
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
