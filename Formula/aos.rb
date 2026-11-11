class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.578.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aos-darwin-arm64"
    sha256 "73fe25d835092f71ad0672d1e3b3e770a7e32e85f1c0192eb7ce5aeee7262fcf"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aoscompose-darwin-arm64"
      sha256 "73fe25d835092f71ad0672d1e3b3e770a7e32e85f1c0192eb7ce5aeee7262fcf"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aosguard-darwin-arm64"
      sha256 "5bcece562078a6b51f512015dd979cf546411fee1a372409fd2398bdf91b3b59"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "f911dd3d6a075216548fbdb19f941a0cfcf3698ba00082bb5c612034dc6a83a7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aos-linux-amd64"
      sha256 "e2637f8ee805e43932f3edb12ac807d0296dd4bdc2ebd3839765f7f27043b73b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aoscompose-linux-amd64"
        sha256 "e2637f8ee805e43932f3edb12ac807d0296dd4bdc2ebd3839765f7f27043b73b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aosguard-linux-amd64"
        sha256 "f99676447883ebbbdf461d92fbcd046675c556f46f665c730158aca13108975f"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aterm-linux-amd64"
        sha256 "b13cb7fc219b4118c8b098488fc9d39977d6f8776e0264c6ac3646fd65445829"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aos-linux-arm64"
      sha256 "e2b0999d03d6bea8e368afa323f3a55296fab6d275c6890228934353c8c36c7a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aoscompose-linux-arm64"
        sha256 "e2b0999d03d6bea8e368afa323f3a55296fab6d275c6890228934353c8c36c7a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aosguard-linux-arm64"
        sha256 "50afad3c1636edd358ed5214eb90e492cfd4437afba125e6cad3f38561ce6b3d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.578.0/aterm-linux-arm64"
        sha256 "2cd72a805689a3e5e00ded4de88f544ca918826925b53139aadab2c4e5db94f7"
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
