class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.587.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aos-darwin-arm64"
    sha256 "7466f9109bec8c0f37537a8e9f7ad68906c190bf0f631244295279169cd9b463"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aoscompose-darwin-arm64"
      sha256 "7466f9109bec8c0f37537a8e9f7ad68906c190bf0f631244295279169cd9b463"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aosguard-darwin-arm64"
      sha256 "4e626ff21233911ee904fa7523a14178853de1f2531f70c901b35df3b68bd5ef"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "86ef93413dbcc02a94dfca6d87dc89ef20572a79dd94e7c82a74deea8a0a4102"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aos-linux-amd64"
      sha256 "839fef320b311604f0f8e20da00743b6c32deb30143362e30875fcbcea204c6d"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aoscompose-linux-amd64"
        sha256 "839fef320b311604f0f8e20da00743b6c32deb30143362e30875fcbcea204c6d"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aosguard-linux-amd64"
        sha256 "75f60ca03137eafd00fed4dc2cea4c9fd40fc26db83405abee1b5e27a57308c3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aterm-linux-amd64"
        sha256 "c1f0a18a323897e6a423b42a943d6dc02ad5b6f300f1f608e550bbb132d8b7e8"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aos-linux-arm64"
      sha256 "6c33a80be7e96b3cd38244acb947447a3e10dd432752f196e94cf86a572663fe"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aoscompose-linux-arm64"
        sha256 "6c33a80be7e96b3cd38244acb947447a3e10dd432752f196e94cf86a572663fe"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aosguard-linux-arm64"
        sha256 "654cd12eadf08c041f6f1abecf27022875bace303842abfb0f2c6a2bbf84506a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.587.0/aterm-linux-arm64"
        sha256 "235fb451591e227904f827fd5e2956b1010d36c447f87152ee8541bb5c2a0dd4"
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
