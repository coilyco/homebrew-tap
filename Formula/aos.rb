class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.634.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aos-darwin-arm64"
    sha256 "872035ea158358740039c656a7f6fa9ecce6a513a5043cf55ba063bb58ba436b"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aoscompose-darwin-arm64"
      sha256 "872035ea158358740039c656a7f6fa9ecce6a513a5043cf55ba063bb58ba436b"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aosguard-darwin-arm64"
      sha256 "64a19cf0f4329e27355182092564be7febce282e8c2f79982b24d52f0f7151f6"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "de61cef79111b886dfa39b1cf24aae200014a47d9d0b56026102b889e6c2a886"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aos-linux-amd64"
      sha256 "06f4a41e293cc5ab69812ea4deb807ea8b8d3fe1a3de51115f1e24bdf3f787c9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aoscompose-linux-amd64"
        sha256 "06f4a41e293cc5ab69812ea4deb807ea8b8d3fe1a3de51115f1e24bdf3f787c9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aosguard-linux-amd64"
        sha256 "5b965787e7a92d7a5da8020606376f5e8aced819c6d4f3f0229e68811b5d31aa"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aterm-linux-amd64"
        sha256 "da0d327006b6e66f907fdeafb2982ae157f5f45d554736ac180adc60a8ff11de"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aos-linux-arm64"
      sha256 "4260c7a07e126cf8c20657c1d1753138d744690185a22b2d8bd193fb23efe113"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aoscompose-linux-arm64"
        sha256 "4260c7a07e126cf8c20657c1d1753138d744690185a22b2d8bd193fb23efe113"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aosguard-linux-arm64"
        sha256 "922cc943a3c65fa80f12116158a95e57504d2dc4219f4721203c3a2ea605923a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.634.0/aterm-linux-arm64"
        sha256 "0a02e246b7b30bce6043d35b0ffc401ec56a44c0078de0307261e2d30e998cd2"
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
