class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.625.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aos-darwin-arm64"
    sha256 "6ddeba43d30033463bafe6a25486b58af4b3820134b875adc97ea45a0c0033e8"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aoscompose-darwin-arm64"
      sha256 "6ddeba43d30033463bafe6a25486b58af4b3820134b875adc97ea45a0c0033e8"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aosguard-darwin-arm64"
      sha256 "5c9a98b96d51918fd84a972193ae3113870b301e686a71d7c60695fa384978d7"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "12364b7e7d98392c2c48dbae3af2e53169ac233bf5ef798d1ccfb9729cb5a9c3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aos-linux-amd64"
      sha256 "e768cea0c9c4706c6a8534635cea345d20661434c6a1cdb8878200a62f9198b4"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aoscompose-linux-amd64"
        sha256 "e768cea0c9c4706c6a8534635cea345d20661434c6a1cdb8878200a62f9198b4"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aosguard-linux-amd64"
        sha256 "244c77e20091d1f31086d8e5ca6df56c00ffde00709e491600db1df4259ace6a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aterm-linux-amd64"
        sha256 "7b11d50c679e8c4b7b5673f5d5f54fba9f731f940afd94bd1bb24a5962db23c3"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aos-linux-arm64"
      sha256 "bd0c92cf2427d092dd0b1fc09d4fe3f60fe39ef97c3f8c408edc958e40f8f2f9"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aoscompose-linux-arm64"
        sha256 "bd0c92cf2427d092dd0b1fc09d4fe3f60fe39ef97c3f8c408edc958e40f8f2f9"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aosguard-linux-arm64"
        sha256 "a7d473ca69a3e265b927f9fd65ff51e3bdcea47b4182209783de05a84d459b89"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.625.0/aterm-linux-arm64"
        sha256 "5b29f4424a794c9a22a4a383410ec8b542f584c6d7d69ff9fcee01f1d3965e6a"
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
