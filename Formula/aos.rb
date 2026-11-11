class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.589.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aos-darwin-arm64"
    sha256 "90666ad0390192ca7cac7d19864a7b1a1fb2f6c39fdb2f25564bf5cfed56be66"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aoscompose-darwin-arm64"
      sha256 "90666ad0390192ca7cac7d19864a7b1a1fb2f6c39fdb2f25564bf5cfed56be66"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aosguard-darwin-arm64"
      sha256 "da045f09ff40093f54aee0a96276aead8c1e704219c74f4afb2c047e9bb0e0e4"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "274c2ccf2968e24c519c572b50d7c27a62922785a15e6886556e0fe5a818f206"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aos-linux-amd64"
      sha256 "f3c9d872c5bcc6f8d71dbe733cc75ee715e268ceac0a83b76480aa55a5ea780a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aoscompose-linux-amd64"
        sha256 "f3c9d872c5bcc6f8d71dbe733cc75ee715e268ceac0a83b76480aa55a5ea780a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aosguard-linux-amd64"
        sha256 "405672cd7e7ca8a87cdf78c24db56bb57e15b52dfe95cef1126d5aa155f9af13"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aterm-linux-amd64"
        sha256 "2f96b02749a2870f8f78eb4e28ba7f7f7424522b16a29a08fc565cc99424c894"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aos-linux-arm64"
      sha256 "84ae4ab3707a2984020b8a5ce16cb918ba10cf348814ba03b6721777380cb23b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aoscompose-linux-arm64"
        sha256 "84ae4ab3707a2984020b8a5ce16cb918ba10cf348814ba03b6721777380cb23b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aosguard-linux-arm64"
        sha256 "2b898bb1aa070c1a8b27e376b16dfe0890308663be2f78e468de905cd2112541"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.589.0/aterm-linux-arm64"
        sha256 "e3e99375002a71a7d51a94c7b9b7d7c275ed8505a924c9fa9f0061e9f7eefc3d"
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
