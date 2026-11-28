class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.647.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aos-darwin-arm64"
    sha256 "15448847ebecab745ea7ba920923922340d91fe782f5c1b865afa77f9ef7f4ed"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aoscompose-darwin-arm64"
      sha256 "15448847ebecab745ea7ba920923922340d91fe782f5c1b865afa77f9ef7f4ed"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aosguard-darwin-arm64"
      sha256 "c06f87bbd0dbc614140fbabbe1d06b88da683bb51dc93378a249fee05f3e7f2f"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "fc491344a195ae806b03bffcd53c9e7e4cbecd32b14ab31f1ffd02705754f253"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aos-linux-amd64"
      sha256 "150215cfd9e8546808fb5c13626ef67153af145bea03f0d7b51e4720b45737e8"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aoscompose-linux-amd64"
        sha256 "150215cfd9e8546808fb5c13626ef67153af145bea03f0d7b51e4720b45737e8"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aosguard-linux-amd64"
        sha256 "8deb29bac074a4545b61808e4884b5accfb45ed3cd715cc22c5f97a69fc86510"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aterm-linux-amd64"
        sha256 "22d201fa870a2ccf4c24fe958f0fa47912d741ad8fa189f2e292355c39dab239"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aos-linux-arm64"
      sha256 "afe5c5f71e85d3cb69d501e2569344c8540eb01bd154a362cabf3d079c182096"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aoscompose-linux-arm64"
        sha256 "afe5c5f71e85d3cb69d501e2569344c8540eb01bd154a362cabf3d079c182096"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aosguard-linux-arm64"
        sha256 "89e6551caac9b8e7aa85137e70bc336d58d397fc849371fce704a139ba9f7427"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.647.0/aterm-linux-arm64"
        sha256 "b5369ca9d72713a67da6497b3b20950385a2b1dd9c293c2a3c514d5335e38dfd"
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
