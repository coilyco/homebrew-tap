class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.628.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aos-darwin-arm64"
    sha256 "97adbb0819aa16de6404235e0ce22132e7517e2e074969dfb05e854568c36b16"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aoscompose-darwin-arm64"
      sha256 "97adbb0819aa16de6404235e0ce22132e7517e2e074969dfb05e854568c36b16"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aosguard-darwin-arm64"
      sha256 "69ca3b6af073d1f4b7463ccb64957d1099a45208578a85a7a33ffb1b878d357e"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "b3b7ebf6f85f18553df7617624c87c348ea1f9cfb5d72d0f80aa590d6dfc86fe"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aos-linux-amd64"
      sha256 "0f325f200cb27607659b8f5ab34f4e12e0285fdbb7940c3e9e41ff93a96ad7ef"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aoscompose-linux-amd64"
        sha256 "0f325f200cb27607659b8f5ab34f4e12e0285fdbb7940c3e9e41ff93a96ad7ef"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aosguard-linux-amd64"
        sha256 "3bceb250e69f1800f518670ff19e2080a85a80688fa0860bceb112929814300c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aterm-linux-amd64"
        sha256 "2b342e08b8ec596ff83d2f96ea20e736cca63607af5deb917bf7ab5cfff28c13"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aos-linux-arm64"
      sha256 "f420496e6a514e05177e7b89b6b4b64ef618c8c5277fbdc171cddfecd95cecb6"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aoscompose-linux-arm64"
        sha256 "f420496e6a514e05177e7b89b6b4b64ef618c8c5277fbdc171cddfecd95cecb6"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aosguard-linux-arm64"
        sha256 "7ca921d1cc163d517109efa7bd8ae18d0b16295e67d01a45686f967ca075d589"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.628.0/aterm-linux-arm64"
        sha256 "e171071ec15ddcc1836e15bbd2bb2c008ad18cced7fff5d01d8f5e3deb2746b3"
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
