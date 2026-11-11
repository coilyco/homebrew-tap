class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.602.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aos-darwin-arm64"
    sha256 "7a0bde560027abcb5f4ed92d912fec5b3a9e8e6f6cf5d423d02cdf3500b1d4db"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aoscompose-darwin-arm64"
      sha256 "7a0bde560027abcb5f4ed92d912fec5b3a9e8e6f6cf5d423d02cdf3500b1d4db"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aosguard-darwin-arm64"
      sha256 "219ccac01b824c5a7d3e158bb51a7bd2c6d47e504024538385ac88df30cc733d"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "349a6dbc9f9d37eef15b6d24d132693eb972916ea8501bef883ef22a74b1b7f1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aos-linux-amd64"
      sha256 "712bc0894b46b86ef10e21d601ff25b79f2412031cfd0e0f7226d4f48827fe29"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aoscompose-linux-amd64"
        sha256 "712bc0894b46b86ef10e21d601ff25b79f2412031cfd0e0f7226d4f48827fe29"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aosguard-linux-amd64"
        sha256 "78422c221aa4640b422ed2d9a0d42a52e930b416fa7e3dd03545612135d7a049"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aterm-linux-amd64"
        sha256 "d1a6cb700c7cad174d0a49a0fd661bbf20d39613d41966d21cf52f1fa372a89c"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aos-linux-arm64"
      sha256 "d73c7adc430bdeb621c01b78cb0660edbd52730cedfa0f4a470b74e6ca81bf60"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aoscompose-linux-arm64"
        sha256 "d73c7adc430bdeb621c01b78cb0660edbd52730cedfa0f4a470b74e6ca81bf60"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aosguard-linux-arm64"
        sha256 "840a190dc8aed8023aaa6ee5e06eff50d3eca3989f52f48d5cca9bae933d9799"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.602.0/aterm-linux-arm64"
        sha256 "5f3bb186f47bab77200ec741464e466c9238b51b926ce87f20ae5999032da454"
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
