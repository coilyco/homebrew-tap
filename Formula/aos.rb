class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.650.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aos-darwin-arm64"
    sha256 "a881a70e9a56d1ef077b1e281526707a8df6f03e936e010162648c1cad490033"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aoscompose-darwin-arm64"
      sha256 "a881a70e9a56d1ef077b1e281526707a8df6f03e936e010162648c1cad490033"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aosguard-darwin-arm64"
      sha256 "bb881a29928712fc319065aee886be85557172ee7ecc1061decac47cb02c2283"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "59181ed39dead7f9a9d7df5e6c6c4cf282326faf7d0be166fc85370d08b4f555"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aos-linux-amd64"
      sha256 "e6adb83149456c5f8d23547e664c778cdd6ef892e118273844f7a016d3d5b699"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aoscompose-linux-amd64"
        sha256 "e6adb83149456c5f8d23547e664c778cdd6ef892e118273844f7a016d3d5b699"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aosguard-linux-amd64"
        sha256 "55c5e94367649726b98de1c1ab9a1b6b795ee6e38b6d4aae22027e94b2dbd1f2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aterm-linux-amd64"
        sha256 "65d440b9582ae696584aa8c132a186092330cb7ec70870849c2d04bce89f0bfd"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aos-linux-arm64"
      sha256 "4960797ad034bbfc247b59332946a014830b64fe8f68588145109fcab9a3f525"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aoscompose-linux-arm64"
        sha256 "4960797ad034bbfc247b59332946a014830b64fe8f68588145109fcab9a3f525"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aosguard-linux-arm64"
        sha256 "e49ca0fc9811e24cd516c6056d8cd2e2c7ae5c109f047a83684f155fbd359919"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.650.0/aterm-linux-arm64"
        sha256 "4032098ebe002ecd4c836d322eac1ee13b5f0f87635a3edd4fcfe5b1fd707d94"
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
