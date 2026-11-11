class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.612.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aos-darwin-arm64"
    sha256 "99d1a4014d0bff498ee98a6ead639edb2de0978a9c45d6353e39e91266043ead"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aoscompose-darwin-arm64"
      sha256 "99d1a4014d0bff498ee98a6ead639edb2de0978a9c45d6353e39e91266043ead"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aosguard-darwin-arm64"
      sha256 "6b3749162a50a1cecc148ab9632f45d7d9fc68883550d3240e084f490e6ab570"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d9601762434e92c4101c1905dbbdd557c5b90ef2916864425771ca1a22b93bc0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aos-linux-amd64"
      sha256 "2c2e750844fc276b2b47c3a9b73f808bf679efd03063b1f681d60c009205bec7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aoscompose-linux-amd64"
        sha256 "2c2e750844fc276b2b47c3a9b73f808bf679efd03063b1f681d60c009205bec7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aosguard-linux-amd64"
        sha256 "75d5cc689d6ae792218712fb5967ea7647f4f7cbf9753dc82c407d2c7f8ef2af"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aterm-linux-amd64"
        sha256 "78e69bb9db4f1e8803c11dc1ac3743deff33dbcab06ea62127420e762a53f410"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aos-linux-arm64"
      sha256 "f7b5c9629a011a2c1b6c9e6f7f02da956cbbe37e1198d8f8f8fb48cf041989d9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aoscompose-linux-arm64"
        sha256 "f7b5c9629a011a2c1b6c9e6f7f02da956cbbe37e1198d8f8f8fb48cf041989d9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aosguard-linux-arm64"
        sha256 "711f40b6f4f934eef9d97b8b546d9ce2fdd2185909db8bb8b4ea8cb851325505"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.612.0/aterm-linux-arm64"
        sha256 "5c45bb16d2d85da9264e3ca47bcb17711c75c73ee16ac850e00e2be5cec40e89"
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
