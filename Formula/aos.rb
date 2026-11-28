class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.640.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aos-darwin-arm64"
    sha256 "19029b251c73631184540952cfa3eeb5a113361409a7b21953bbae6a2d1d01b4"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aoscompose-darwin-arm64"
      sha256 "19029b251c73631184540952cfa3eeb5a113361409a7b21953bbae6a2d1d01b4"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aosguard-darwin-arm64"
      sha256 "b6166de88ba76c857819c0bc3f6b608efd8685dccf8d82f568f382795361274a"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "e8b2879578c2b56318486d1294d94df7cd33f51f3aa49bb6d7289ba2ec59cedc"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aos-linux-amd64"
      sha256 "f88e7939e2e76a9e250911d4c260ed5f6b6fd2bf4e1a4354dfb43320cd8f608f"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aoscompose-linux-amd64"
        sha256 "f88e7939e2e76a9e250911d4c260ed5f6b6fd2bf4e1a4354dfb43320cd8f608f"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aosguard-linux-amd64"
        sha256 "92f2efd5021c2a89119c10e56f4bee80a9de2ef9364e35325b5f066b99a5b14b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aterm-linux-amd64"
        sha256 "35db892b88d700ec981f03025680de72194667c8ede11c1cfebae99623fd824f"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aos-linux-arm64"
      sha256 "c593d314020633f7e25f114b4e99b3bde1fdae5132f7e9b79ad681315b826f58"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aoscompose-linux-arm64"
        sha256 "c593d314020633f7e25f114b4e99b3bde1fdae5132f7e9b79ad681315b826f58"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aosguard-linux-arm64"
        sha256 "1995757f439b3efbb743db5e78651357ff6150ddbbc449389f8316fa217a8b1d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.640.0/aterm-linux-arm64"
        sha256 "4703dba5186904627eaf704f354d204ab932f801d0d44ca217b882661399d359"
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
