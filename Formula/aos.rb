class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.444.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aos-darwin-arm64"
      sha256 "cb2e7fa9827b12205933358d16045cba7126364cc40835d8bd63ecf0e7171f4a"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aoscompose-darwin-arm64"
        sha256 "cb2e7fa9827b12205933358d16045cba7126364cc40835d8bd63ecf0e7171f4a"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aosward-darwin-arm64"
        sha256 "cb2e7fa9827b12205933358d16045cba7126364cc40835d8bd63ecf0e7171f4a"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aosguard-darwin-arm64"
        sha256 "2d7c781899c460f866f8dce9de9a46e59a45115b36ec3d11fc6deef4d8318cbc"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aterm-darwin-arm64"
        sha256 "b2582eb4b12b89a793234561cd46ade7e7700a8fe57a2ea87b4552946d43922f"
      end
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aos-linux-amd64"
      sha256 "245f3878436f0ed4b53eb5ffa1224936d7f16eaa0956dfbe54f75d0b688a4c98"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aoscompose-linux-amd64"
        sha256 "245f3878436f0ed4b53eb5ffa1224936d7f16eaa0956dfbe54f75d0b688a4c98"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aosward-linux-amd64"
        sha256 "245f3878436f0ed4b53eb5ffa1224936d7f16eaa0956dfbe54f75d0b688a4c98"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aosguard-linux-amd64"
        sha256 "dcee2437a16a5d820a28531e4c7bd3d0455455ea3dbee6a5e224e3c4d95f051b"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aterm-linux-amd64"
        sha256 "fe7da9422c363bd8a1dc2796c2d8a94c607a4625a99fb76212aa354a1bacec98"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aos-linux-arm64"
      sha256 "9c12ffb86ddf1db380a1d191076e78d68aa6fb4ca51e5c35e4f32215d138dd84"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aoscompose-linux-arm64"
        sha256 "9c12ffb86ddf1db380a1d191076e78d68aa6fb4ca51e5c35e4f32215d138dd84"
      end
      resource "aosward" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aosward-linux-arm64"
        sha256 "9c12ffb86ddf1db380a1d191076e78d68aa6fb4ca51e5c35e4f32215d138dd84"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aosguard-linux-arm64"
        sha256 "8069798cff29b200aea22dbc577c688101191b8252ce46962b2d7a02705d1d7e"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.444.0/aterm-linux-arm64"
        sha256 "7766849fdf5fed9343c4e8aad8ccff3588959821d68c74cada3261202b22701c"
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
