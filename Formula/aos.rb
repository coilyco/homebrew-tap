class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.596.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aos-darwin-arm64"
    sha256 "75a0c316966f20ef24596677310b136ee8eecc2ae0a01bdad308ee2954696ed0"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aoscompose-darwin-arm64"
      sha256 "75a0c316966f20ef24596677310b136ee8eecc2ae0a01bdad308ee2954696ed0"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aosguard-darwin-arm64"
      sha256 "c377a76f1555f0f0507f07c1a3e41eda60ecea2e8cea18854c0308e443fa77b3"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "a382ea676e72eaf99e99dc322b2f8a9692caeb8bee080ac1205c1b7b754d3e86"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aos-linux-amd64"
      sha256 "d2e406c988770c230bf41beb9b62d139ae5bc45bfa96f07319c5c153780cac2b"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aoscompose-linux-amd64"
        sha256 "d2e406c988770c230bf41beb9b62d139ae5bc45bfa96f07319c5c153780cac2b"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aosguard-linux-amd64"
        sha256 "03a41d65aaf502b3cb49528044f289a6122e7939763433bc092713a645b5cf9c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aterm-linux-amd64"
        sha256 "a443c3984c63fb52a77304a93f23405ab821716eb13a305bd3a67f3ca814700d"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aos-linux-arm64"
      sha256 "8e1d969cb8e5334737b03066bc7c9d388684b5d625275ae92314cdc08f4e17e4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aoscompose-linux-arm64"
        sha256 "8e1d969cb8e5334737b03066bc7c9d388684b5d625275ae92314cdc08f4e17e4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aosguard-linux-arm64"
        sha256 "58f7060c8c595dcf4d250d9348731d5d05f4a50c183b115a6ac0092c8d0521ad"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.596.0/aterm-linux-arm64"
        sha256 "925c2e82ae815019db90bbdb15bd9198b84fa50b004af516b6556b8273de1ace"
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
