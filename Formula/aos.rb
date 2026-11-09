class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.543.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aos-darwin-arm64"
    sha256 "4c186d9b2d2727e348304f1ca613e1a92690d97b63506def5aa457408e04f4a1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aoscompose-darwin-arm64"
      sha256 "4c186d9b2d2727e348304f1ca613e1a92690d97b63506def5aa457408e04f4a1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aosguard-darwin-arm64"
      sha256 "baa03ded7a8f273920bac67ef0feca6d80651da11f8c5ad7346350ecb077794a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "058c82ce8b45a7a5e0548204bbdcbf221404973bca6af50497530547b38e361e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aos-linux-amd64"
      sha256 "f1b6fcbf9e260c5d467af6db2edb49985fe53332c9d2439e0f58bc77b56840f3"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aoscompose-linux-amd64"
        sha256 "f1b6fcbf9e260c5d467af6db2edb49985fe53332c9d2439e0f58bc77b56840f3"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aosguard-linux-amd64"
        sha256 "a08c5d86658ec2a2b6b24101d3baa9140279a1c4370246232b459dcae0c11063"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aterm-linux-amd64"
        sha256 "3f474c8efa4c984b046a836c41bf07a7dfabc2260f275fc6d228529fe8d58c9d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aos-linux-arm64"
      sha256 "ad3cd21144b7fe5624db5a88839fb4f255fc0da2b8f282302e53205bc7a1b2bb"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aoscompose-linux-arm64"
        sha256 "ad3cd21144b7fe5624db5a88839fb4f255fc0da2b8f282302e53205bc7a1b2bb"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aosguard-linux-arm64"
        sha256 "cba1abc0bf9676a13246e9e0f5ffad4c189e2de2fefd2f83bade0901d6b30dfe"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.543.0/aterm-linux-arm64"
        sha256 "35dfb351be2c87d1e43dada95161aa5e94103becc56c92a8bfd9fa6389f0b870"
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
