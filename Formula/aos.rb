class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.562.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aos-darwin-arm64"
    sha256 "0ef219a49e91fe31f262f5fa1ff9f3c812294cd90632c8c3ca728813f3af2a2e"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aoscompose-darwin-arm64"
      sha256 "0ef219a49e91fe31f262f5fa1ff9f3c812294cd90632c8c3ca728813f3af2a2e"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aosguard-darwin-arm64"
      sha256 "4379eeeb819027b9b7f99789dbd161a162ecfe6c181cce9ca1ad93ce5e0e2448"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "eb7932722af3b8f1f207827466a94551ed76128f77aca9116a7a228e5abafc6b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aos-linux-amd64"
      sha256 "574ba20eba2800c2fffc787bf05aff5bf9b6ec9fc36f16b302e99fc3394ad27e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aoscompose-linux-amd64"
        sha256 "574ba20eba2800c2fffc787bf05aff5bf9b6ec9fc36f16b302e99fc3394ad27e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aosguard-linux-amd64"
        sha256 "d89e2d5653555b6ac12991a0f1d0988136ddafc69c572aa86f87aae15af2aa79"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aterm-linux-amd64"
        sha256 "682f8d8743f9ae42321ebb09aafff9af56eeab6dc6a970d81b954578803df0e1"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aos-linux-arm64"
      sha256 "cc109436efcc824376c0ec70109cee7058b25a4745b366768b63999666b429b3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aoscompose-linux-arm64"
        sha256 "cc109436efcc824376c0ec70109cee7058b25a4745b366768b63999666b429b3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aosguard-linux-arm64"
        sha256 "a4709c2dc9309eca5c933c53d1bb5b469f5ba98d07065f9c4e6f57cb182cd4fa"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.562.0/aterm-linux-arm64"
        sha256 "a2cfe81101125c346f697a5dacd496eb154804f854bd5bc9e4a3464f2369dd2e"
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
