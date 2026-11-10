class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.571.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aos-darwin-arm64"
    sha256 "e41e10918b94acc225b98d6eb25b062e84b5ec9cda062bde4d00812a9e6c49e1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aoscompose-darwin-arm64"
      sha256 "e41e10918b94acc225b98d6eb25b062e84b5ec9cda062bde4d00812a9e6c49e1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aosguard-darwin-arm64"
      sha256 "18bca71b698286f7c656b54a587cacb1ca82c359e85e167b3e04468e53a5ca99"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "31b1b7239d8cb624cff79deb8d9830d30d01efed04ad03a2b755047de5824a6b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aos-linux-amd64"
      sha256 "e52e98034220975a2a6694516523ae6a303de6026bc285a285bfc2c0ba8498a5"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aoscompose-linux-amd64"
        sha256 "e52e98034220975a2a6694516523ae6a303de6026bc285a285bfc2c0ba8498a5"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aosguard-linux-amd64"
        sha256 "974e6296db6df0380a53c3bfa524bc3a1da4da6a2c70e98061d0536c7cf15285"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aterm-linux-amd64"
        sha256 "56c872224604c62ea78d45aa217e62acfaa6c268192550e9fa6a00e6d6e0216e"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aos-linux-arm64"
      sha256 "2bf0a5199b00922de753e59773f72380e8017de86c638862b14efa36fb881c08"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aoscompose-linux-arm64"
        sha256 "2bf0a5199b00922de753e59773f72380e8017de86c638862b14efa36fb881c08"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aosguard-linux-arm64"
        sha256 "000e5da3a502cac7b5870889e21feb70bce7dad74923973e7e4194e162893974"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.571.0/aterm-linux-arm64"
        sha256 "d13acc9cfce8b7aebaeefa8d4e0a06eabd0463d2fd8941f33a413b92b66703c4"
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
