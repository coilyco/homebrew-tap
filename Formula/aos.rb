class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.627.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aos-darwin-arm64"
    sha256 "61934f2656f6b4885c4ed12b915aece3890564a7710586b5149729803a1c1a6e"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aoscompose-darwin-arm64"
      sha256 "61934f2656f6b4885c4ed12b915aece3890564a7710586b5149729803a1c1a6e"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aosguard-darwin-arm64"
      sha256 "a4a3367cb5ce6079ec337f4335f1786e7617a8b82cead358b51b4de31990ec52"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "cb16b91d0cd858a1830ee4ee7e7fbe739c4211821b4c68d4a6b3b59c8565af1d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aos-linux-amd64"
      sha256 "c9422c802c13b4f5ecd48c2e3d5c0335f90f250d8323d49fafcd7a81dd696816"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aoscompose-linux-amd64"
        sha256 "c9422c802c13b4f5ecd48c2e3d5c0335f90f250d8323d49fafcd7a81dd696816"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aosguard-linux-amd64"
        sha256 "817b9f7a270214196a19b2f816415bc71fee7c31e5891f000eaf3d2e0c541026"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aterm-linux-amd64"
        sha256 "9d5188174b8f42e7cbde819dda8877483d48d0bf50e4236276d0ec4d8e209f90"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aos-linux-arm64"
      sha256 "06436283d41b2f78c93893c5edbdbc55833c671437b1a09d3d940662e5475607"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aoscompose-linux-arm64"
        sha256 "06436283d41b2f78c93893c5edbdbc55833c671437b1a09d3d940662e5475607"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aosguard-linux-arm64"
        sha256 "96351ff02461659e2d7f54862d2cbf62edac009d6b3253b12b75bf288774e620"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.627.0/aterm-linux-arm64"
        sha256 "d5ba099c4ad2825b20db3edec9bbd1da7fbd00f98193aff9319284b63891f74b"
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
