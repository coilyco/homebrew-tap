class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.646.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aos-darwin-arm64"
    sha256 "c52d45213b1b8cb46bb69a694324bf3abde670305d2b7e0f46a83c48d71d0aa6"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aoscompose-darwin-arm64"
      sha256 "c52d45213b1b8cb46bb69a694324bf3abde670305d2b7e0f46a83c48d71d0aa6"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aosguard-darwin-arm64"
      sha256 "47fcf993a97123b6c94101e76f1479532dd84a5700ce9208ddc68dffefe4442b"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d1d63dbc9e32e24d3f8a9f1870b526326c717ba98d06eca01307b66a1b2fad26"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aos-linux-amd64"
      sha256 "7c52851e140fb71de42f668f6caa142908674a242257dbcc31335246e4a1c27e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aoscompose-linux-amd64"
        sha256 "7c52851e140fb71de42f668f6caa142908674a242257dbcc31335246e4a1c27e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aosguard-linux-amd64"
        sha256 "e811c9fe0197ba92c79c9004c7bdf8f8849594d3a281d04333d26175f3967a8c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aterm-linux-amd64"
        sha256 "2e6aa8595d0120c341a6a7dfe06cf7ae8176903f22e6f25e463fc86579587f30"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aos-linux-arm64"
      sha256 "0feb53d26577b2f86f89e49ae9bdbf7d9c2e13fe9e68d18c0a4242405fb292aa"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aoscompose-linux-arm64"
        sha256 "0feb53d26577b2f86f89e49ae9bdbf7d9c2e13fe9e68d18c0a4242405fb292aa"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aosguard-linux-arm64"
        sha256 "0de072fd3005d4859747fd5b912ed25ed8fb301a3a1aa34cd7cb274ea5929a46"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.646.0/aterm-linux-arm64"
        sha256 "c04c22e72ac456868763ef1483f0f4bd95b8b15f9289f927f75e27332a48bc96"
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
