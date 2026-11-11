class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.577.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aos-darwin-arm64"
    sha256 "2c5929c33d5b3c3f88f843ece863fa78b85dc0b9d7503f51d7b17e1aa4a2bf94"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aoscompose-darwin-arm64"
      sha256 "2c5929c33d5b3c3f88f843ece863fa78b85dc0b9d7503f51d7b17e1aa4a2bf94"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aosguard-darwin-arm64"
      sha256 "f8e4e4b998368eadc1727fc81d72e7c789db6510c9aaf4afb7d9f77b7247de9a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "1dc645601a06e83e2c56743efa48f84c55b4666044e8bacaf01d65e9e151e115"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aos-linux-amd64"
      sha256 "33246f56b966f35ff40138fa3ef1cd2dd357eb2acded5a604c104bcf3be2f3df"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aoscompose-linux-amd64"
        sha256 "33246f56b966f35ff40138fa3ef1cd2dd357eb2acded5a604c104bcf3be2f3df"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aosguard-linux-amd64"
        sha256 "359420c365b9cff6f0b1ffafea923bf5e75ec2d4508196e853352d6601f90d5a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aterm-linux-amd64"
        sha256 "91cf8d1584c8e6a3fbf544dbf2344af771627c516bb92463b1698584478071d2"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aos-linux-arm64"
      sha256 "59c9a97f404963781f3da84140c1631b644e161a1fb807c61f64907eeb3cd4e9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aoscompose-linux-arm64"
        sha256 "59c9a97f404963781f3da84140c1631b644e161a1fb807c61f64907eeb3cd4e9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aosguard-linux-arm64"
        sha256 "5cdaab5a12acd3ff43c0218b0b6f6502ecc859a184ebcfd7bef160bdd1addd5c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.577.0/aterm-linux-arm64"
        sha256 "988da249ff3fe836fdf0afa9d447608f3eeb98899b79c5e7b57ed3b823c8c351"
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
