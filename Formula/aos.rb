class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.638.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aos-darwin-arm64"
    sha256 "a1f854a5d2983640c685897c780bd03e09681b6bd5dfb2147434ab30c8b3afdf"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aoscompose-darwin-arm64"
      sha256 "a1f854a5d2983640c685897c780bd03e09681b6bd5dfb2147434ab30c8b3afdf"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aosguard-darwin-arm64"
      sha256 "50b813f767b87d7022a3e10f2b7685ecfefa3a3a6509a64bb4696a8ad56ad285"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "a501b71937656cf0dcb582b79f5835c2454043e286923d9f5f316b47b93b9824"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aos-linux-amd64"
      sha256 "9a0592c1b3e9e08dffc21922efcf95475329452a0793033a49e72ee7bf05a2ac"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aoscompose-linux-amd64"
        sha256 "9a0592c1b3e9e08dffc21922efcf95475329452a0793033a49e72ee7bf05a2ac"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aosguard-linux-amd64"
        sha256 "7cff66b3454a6584a09af148ab52ccadb11be582b9f7a0c616bd3de5da3e4cbb"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aterm-linux-amd64"
        sha256 "0341f98b742d1da7219521b245907103cc3dc7f1e5a9724a9ea77bf3b5ed7f2a"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aos-linux-arm64"
      sha256 "44807546b7fca009769aa4afd9b8a7c5cc02787cb8026c30e2e4d6675e604888"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aoscompose-linux-arm64"
        sha256 "44807546b7fca009769aa4afd9b8a7c5cc02787cb8026c30e2e4d6675e604888"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aosguard-linux-arm64"
        sha256 "cca8c8ceeaeccf2df666a22884d05a550ac6f579e278615ef3971ece261cfd10"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.638.0/aterm-linux-arm64"
        sha256 "1e08765fd4511cca161df6c15f62099c6f1a7d684a7dd9544c6b4eabf58f060e"
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
