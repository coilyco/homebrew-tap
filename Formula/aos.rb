class Aos < Formula
  desc "Agent runtime composition root for Agentic OS"
  homepage "https://github.com/coilyco/agentic-os"
  version "0.541.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aos-darwin-arm64"
    sha256 "ee4dc22c74a6583f32049d40a286ae336a8940cbbdbcb6af8fcacaf30daa379a"
    resource "aoscompose" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aoscompose-darwin-arm64"
      sha256 "ee4dc22c74a6583f32049d40a286ae336a8940cbbdbcb6af8fcacaf30daa379a"
    end
    resource "aosguard" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aosguard-darwin-arm64"
      sha256 "a090f1f574758cab70524cdba045572737b08f869501a1e1539a2f98ec4337f9"
    end
    resource "aterm" do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aterm-darwin-arm64.app.tar.gz", using: :nounzip
      sha256 "d92b21fc1b9afa4ba91af5d0b6611509e17a373ed6ec277cc3b09fbdde01b3d8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aos-linux-amd64"
      sha256 "0238f4cf3f104f35151531768c8328e8943c9dedd36f1f53eab2946f7c04ff31"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aoscompose-linux-amd64"
        sha256 "0238f4cf3f104f35151531768c8328e8943c9dedd36f1f53eab2946f7c04ff31"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aosguard-linux-amd64"
        sha256 "aa84a75f55545fc58d05ba859594cdd76ea065beaa49e8ec3273d74407f07e49"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aterm-linux-amd64"
        sha256 "26e0e88900061798d70a40ccec77b62fa50cc1fc5aa7cfc8b08952de930d9ad7"
      end
    end
    on_arm do
      url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aos-linux-arm64"
      sha256 "7636675a950461ad8a06585ad83ff90cc7c3b81072ebf450f40e059ff63c661c"
      resource "aoscompose" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aoscompose-linux-arm64"
        sha256 "7636675a950461ad8a06585ad83ff90cc7c3b81072ebf450f40e059ff63c661c"
      end
      resource "aosguard" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aosguard-linux-arm64"
        sha256 "c66c964dcb91b2ff794e9f444dea38ed9f4858ebb5196d15e223dfbb6a31eff2"
      end
      resource "aterm" do
        url "https://github.com/coilyco/agentic-os/releases/download/aos-v0.541.0/aterm-linux-arm64"
        sha256 "f45055123e3ff4ce3cc7f3f098514f52ff0161395fa55fd57d1c157b614582c0"
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
