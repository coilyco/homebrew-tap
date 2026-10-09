class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.455.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aos-darwin-arm64"
      sha256 "6e8bf3d0693248a223840f5aa86790d2141b3a0c35282afb38e96acea8da726c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aoscompose-darwin-arm64"
        sha256 "6e8bf3d0693248a223840f5aa86790d2141b3a0c35282afb38e96acea8da726c"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aosward-darwin-arm64"
        sha256 "6e8bf3d0693248a223840f5aa86790d2141b3a0c35282afb38e96acea8da726c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aosguard-darwin-arm64"
        sha256 "f1fde01e8a365ec728e1a96c42b326b70621775f4e7999aa31d169981c6b4a32"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aterm-darwin-arm64"
        sha256 "edc976173fe247367d28c04e70131f7e478d7b266ba0b69fee5441bf7136eab9"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aos-linux-amd64"
      sha256 "600479d954d4109bf4b78a1bd7d44691f48f016dbdd58e7f832e463d0a8bc760"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aoscompose-linux-amd64"
        sha256 "600479d954d4109bf4b78a1bd7d44691f48f016dbdd58e7f832e463d0a8bc760"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aosward-linux-amd64"
        sha256 "600479d954d4109bf4b78a1bd7d44691f48f016dbdd58e7f832e463d0a8bc760"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aosguard-linux-amd64"
        sha256 "c4fc4588be8d02c45a18995be01c9cf6ea7e2a30402f340c826654e521d67c3a"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aterm-linux-amd64"
        sha256 "eeb5f74ab6f42cfe4e3bf50572d94e0937a049615be5aa7d148625d6dfb489d7"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aos-linux-arm64"
      sha256 "de9f4b487dafc010248c502e1e9f7dadc9b2ab72c3e1ead939a7923b95689dd7"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aoscompose-linux-arm64"
        sha256 "de9f4b487dafc010248c502e1e9f7dadc9b2ab72c3e1ead939a7923b95689dd7"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aosward-linux-arm64"
        sha256 "de9f4b487dafc010248c502e1e9f7dadc9b2ab72c3e1ead939a7923b95689dd7"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aosguard-linux-arm64"
        sha256 "a8607d13f6feb0a96ac20ebc8a2af6235de9b479571e4cc414f2d863b9aa7b4c"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.455.0/aterm-linux-arm64"
        sha256 "6de8deb5fd9781b82a27a0cf8fb0039a6de5a8f4836c92529971bb3a700f46fd"
      end
    end
  end

  def install
    bin.install Dir["aos-*"].first => "aos"
    resource("aoscompose").stage { bin.install Dir["aoscompose-*"].first => "aoscompose" }
    bin.install_symlink bin/"aoscompose" => "aoscomposed"
    resource("aosward").stage { bin.install Dir["aosward-*"].first => "aosward" }
    resource("aosguard").stage { bin.install Dir["aosguard-*"].first => "aosguard" }
    resource("aterm").stage { bin.install Dir["aterm-*"].first => "aterm" }
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aos version")
    assert_match version.to_s, shell_output("#{bin}/aoscompose version")
    assert_match version.to_s, shell_output("#{bin}/aoscomposed version")
    assert_match version.to_s, shell_output("#{bin}/aosward version")
    assert_match version.to_s, shell_output("#{bin}/aosguard --version")
    assert_match version.to_s, shell_output("#{bin}/aterm --version")
  end
end
