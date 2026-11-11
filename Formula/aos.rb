class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.594.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aos-darwin-arm64"
    sha256 "053b7448307cae61d7529d130c55ef6ad293de47be83ce5e5a4a719222143afa"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aoscompose-darwin-arm64"
      sha256 "053b7448307cae61d7529d130c55ef6ad293de47be83ce5e5a4a719222143afa"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aosguard-darwin-arm64"
      sha256 "7acfa6a858e076848bd38b15980ec7478176e2167b68a1f834730f3044a47fd8"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "cd09318960508f24efb552e732fcef728d6dd5de7b06dab39390e0e31aab253e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aos-linux-amd64"
      sha256 "ca3c92ca6ed8725005bd2562c8d16daaa8b48d935b21b87b8aee523b35bb2aba"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aoscompose-linux-amd64"
        sha256 "ca3c92ca6ed8725005bd2562c8d16daaa8b48d935b21b87b8aee523b35bb2aba"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aosguard-linux-amd64"
        sha256 "efc8a8dd6c0b7a65fc247913118a0fe949adbd7b0ac2ef0e72dfee3ec6475c71"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aterm-linux-amd64"
        sha256 "a537f6b6028aeef307a7828b1e24ab7820a7eba93ed08b23d687cd5c15fbb203"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aos-linux-arm64"
      sha256 "190d88bd34c61d436d90e38154637234a94a250f02c147b678d12dfcf4081e2b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aoscompose-linux-arm64"
        sha256 "190d88bd34c61d436d90e38154637234a94a250f02c147b678d12dfcf4081e2b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aosguard-linux-arm64"
        sha256 "ed0167748aed3c60fd9e23d09f326157a00222d7c7368b6d6e0133c4a2698728"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.594.0/aterm-linux-arm64"
        sha256 "3c614758484e48eab5fd49d2b5460a33554f5f26b83a2f45f7bb376dc68198c1"
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
