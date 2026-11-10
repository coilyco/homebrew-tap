class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.563.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aos-darwin-arm64"
    sha256 "998aa5b75041425f8a7e7335a588b4b19f4f49a72761a76becaf65d5aca0651a"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aoscompose-darwin-arm64"
      sha256 "998aa5b75041425f8a7e7335a588b4b19f4f49a72761a76becaf65d5aca0651a"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aosguard-darwin-arm64"
      sha256 "dc8756cc7febab5f2930dc575491359ed5676d8e1558ba85074075c3b2e56837"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "11b449f049a399abd5b7444865d7496db27447227ebfd6fee01145519383dec3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aos-linux-amd64"
      sha256 "c146520fe0ce106351f599abe9bda83eff3e525f21006be96e07e235e037d682"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aoscompose-linux-amd64"
        sha256 "c146520fe0ce106351f599abe9bda83eff3e525f21006be96e07e235e037d682"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aosguard-linux-amd64"
        sha256 "d15e797c82e456c9f21e8d9aec44b78c1e604c6d489116c9468d65d429f75c26"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aterm-linux-amd64"
        sha256 "56b76a648ff2149942019799e61b0bf3b5f88941c6b55b2ce9449cffea7e7ee4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aos-linux-arm64"
      sha256 "b59bbdd46d2b3df02a8afd7db3200e52980d4cba75e935f0bedc05c8582dcc2e"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aoscompose-linux-arm64"
        sha256 "b59bbdd46d2b3df02a8afd7db3200e52980d4cba75e935f0bedc05c8582dcc2e"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aosguard-linux-arm64"
        sha256 "d53835190d0ea291ddaa6edacc6847bc0f1005ca41cf7f403f1fa94016877422"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.563.0/aterm-linux-arm64"
        sha256 "60105f34b7ee83e424c301ed981f3cdfca8a7dcb18d61c903fc5a4adb146afe9"
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
