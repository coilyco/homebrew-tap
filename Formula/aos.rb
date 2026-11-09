class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.551.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aos-darwin-arm64"
    sha256 "ac12c54c947525944c7bc2dd28b7e09d6fe7bbe75871440e1e94c608c9815549"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aoscompose-darwin-arm64"
      sha256 "ac12c54c947525944c7bc2dd28b7e09d6fe7bbe75871440e1e94c608c9815549"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aosguard-darwin-arm64"
      sha256 "5e584011df479e3b282945ae5920ae1a93750546794884d101d2585aaa0f70bf"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "76375cfd88ec9eb7f9723adf9c045310e50803f9268918102e7fc9f73f80f233"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aos-linux-amd64"
      sha256 "a7e0243cf65186327837e6f3f270d4deff40c935231e93b981580887d67dc832"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aoscompose-linux-amd64"
        sha256 "a7e0243cf65186327837e6f3f270d4deff40c935231e93b981580887d67dc832"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aosguard-linux-amd64"
        sha256 "e5e6786a4d6ae1909260f9e9c47ed966cbea4466944a7b4adc99b267a37232e3"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aterm-linux-amd64"
        sha256 "9a822255bf68858ab7e3147deb6e58a7f142f227087d89fea01e14377fec5bf4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aos-linux-arm64"
      sha256 "72a4c2fdaacb87b0bd671a76e9bc7bfc338d79f91250c1c661551f3676e9a4a0"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aoscompose-linux-arm64"
        sha256 "72a4c2fdaacb87b0bd671a76e9bc7bfc338d79f91250c1c661551f3676e9a4a0"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aosguard-linux-arm64"
        sha256 "8ce7bfa27111f816fb5b8bdae8f44ca2bc725051b6793ad791e3a6c22584aa0c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.551.0/aterm-linux-arm64"
        sha256 "7eb64f9d27e241dce2c741d43b5978a55a932cfa67b94ca6cb345aa1ee267c03"
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
