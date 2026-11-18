class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.620.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aos-darwin-arm64"
    sha256 "35a7b7de9c481a6704a3992d230c970b7ef09e54161cd7d93423f8adaa10b4c1"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aoscompose-darwin-arm64"
      sha256 "35a7b7de9c481a6704a3992d230c970b7ef09e54161cd7d93423f8adaa10b4c1"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aosguard-darwin-arm64"
      sha256 "d6561ff4ab8f1400ca78891be867b21787432489261b31f6df33205ac932bdda"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "ae7d29ff4132c7d218daceebea1dcd2614a4956caa0b5a98dd672c0445d392b5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aos-linux-amd64"
      sha256 "d10978b92e605a8e8ebf72dbe507588f9f6d213b305f0d40956f6576b96a0743"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aoscompose-linux-amd64"
        sha256 "d10978b92e605a8e8ebf72dbe507588f9f6d213b305f0d40956f6576b96a0743"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aosguard-linux-amd64"
        sha256 "b8fb7e0f832b32b50872a3fd0c50eccf8e6d996fbdc141113cf21e059b2f731d"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aterm-linux-amd64"
        sha256 "f06dca34c2b35c76bd4f376e6bdccb55cd1dc425de61ec334ca07d614641f9c4"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aos-linux-arm64"
      sha256 "0d2d41b96587cd5420ff0f249ea9c3b40f51ca23b29ea04d26ca9f34c0299bdd"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aoscompose-linux-arm64"
        sha256 "0d2d41b96587cd5420ff0f249ea9c3b40f51ca23b29ea04d26ca9f34c0299bdd"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aosguard-linux-arm64"
        sha256 "7a32402e77415ce7febd9378ae96d63732fd7d70e45fac03c46fd4348ea2ed96"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.620.0/aterm-linux-arm64"
        sha256 "2f7eaae7f75298663ea65746a57b7922ea0c8463976bcc0524071e5090f5c027"
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
